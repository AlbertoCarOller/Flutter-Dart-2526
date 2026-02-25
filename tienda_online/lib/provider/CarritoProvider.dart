import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tienda_online/api/Producto.dart';

class CarritoProvider extends ChangeNotifier {
  // Creamos un mapa que representa el carrito local
  Map<Producto, int> productos = {};

  // Creamos un mapa que representa el carrito de Firebase
  Map<String, int> productosFirebase = {};

  /// Creamos una función que va a añadir un producto al carrito local
  Future<void> addProducto(Producto producto, DocumentReference doc) async {
    // En caso de que el producto ya exista se incrementa en 1 su stock
    if (productos.containsKey(producto)) {
      productos.update(producto, (value) => ++value);
      // En caso de que el producto no exista se añade con el stock de 1
    } else {
      productos[producto] = 1;
    }
    // Añadimos en firebase el producto, en caso de que exista se incrementa en 1, en caso de que no, se añade 1
    await doc.set({
      "CarritoActual": {producto.id.toString(): FieldValue.increment(1)},
    }, SetOptions(merge: true));
    // Se notifica a los escuchadores
    notifyListeners();
  }

  /// Creamos una función que va a cargar los datos del carrito del usuario en la memoria local
  Future<void> cargarProductosFirebase(DocumentReference doc) async {
    // El get() devuelve el snapshot del Document
    productosFirebase = await doc.get().then((value) {
      // Obtenemos el mapa del carrito y lo cargamos en el local
      Map<String, dynamic> datos = value.data() as Map<String, dynamic>;
      // Devolvemos el mapa con los ids y cantidad de cada producto
      Map<String, dynamic> carrito = datos["CarritoActual"] ?? {};
      return carrito.map((key, value) => MapEntry(key, (value as num).toInt()));
    });
  }

  /// Esta función va a devolver un Mapa con los productos reales de los cuales se acumularon su id
  /// en Firebase
  Future<void> mergeCarritoToLocal(
    Future<List<Producto>> productosTotales,
    DocumentReference doc,
  ) async {
    try {
      // Obtenemos los productos de Firebase
      await cargarProductosFirebase(doc);
      // Esperamos a que cargen los prodcutos de la API
      List<Producto> productosCargados = await productosTotales.then(
        (value) => value,
      );
      // Nos quedamos con los productos guardados en firebase de toda la lista de productos y se lo asignamos al mapa local
      productos = productosFirebase.map(
        (key, value) => MapEntry(
          productosCargados
                  .where((element) => element.id.toString() == key)
                  .firstOrNull ??
              Producto(
                id: 0,
                title: "Sin productos",
                price: 0,
                description: "",
                category: "",
                image: "",
                rating: Rating(rate: 0, count: 0),
              ),
          value,
        ),
      );
    } catch (e) {
      print("Error: $e");
      productos = {};
    }
    notifyListeners();
  }

  /// Esta función va a eliminar 1 stock (carrito) del producto o el producto completo
  Future<void> eliminarProducto(
    Producto producto,
    DocumentReference doc,
  ) async {
    // En caso de que el stock en la bolsa sea mayor a 1, solo se resta 1
    if (productos.entries
            .firstWhere((element) => element.key == producto)
            .value >
        1) {
      // Decrementamos en 1 la cantidad que hay en el carrito del usuario (local)
      productos.update(producto, (value) => --value);
      // Decrementamos la cantidad en firebase, usamos merge para no borrar el map completo
      doc.set({
        "CarritoActual": {producto.id.toString(): FieldValue.increment(-1)},
      }, SetOptions(merge: true));
      // En caso de que el stock sea 1, eliminamos el producto directamente de la lista
    } else {
      // Eliminamos localmente
      productos.remove(producto);
      // Eliminamos de firebase
      doc.set({
        "CarritoActual": {producto.id.toString(): FieldValue.delete()},
      }, SetOptions(merge: true));
    }
    notifyListeners();
  }

  /// Esta función va a eliminar todos los productos del carrito
  Future<void> eliminarProductos(DocumentReference doc) async {
    // Eliminamos los productos localmente
    productos = {};
    // Quitamos todo lo que hay en el carrito (Firebase)
    doc.update({"CarritoActual": {}});
    notifyListeners();
  }
}
