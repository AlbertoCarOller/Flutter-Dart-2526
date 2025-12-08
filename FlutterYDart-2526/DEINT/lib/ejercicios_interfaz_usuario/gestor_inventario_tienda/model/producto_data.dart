enum Categoria { electronica, ropa, hogar }

class Producto {
  String nombre;
  double precio;
  int stock;
  Categoria categoria;
  bool enOferta;
  List<String> etiquetas;
  String urlImage;

  Producto(
    this.nombre,
    this.precio,
    this.stock,
    this.categoria,
    this.enOferta,
    this.etiquetas,
    this.urlImage,
  );
}

class InventarioDataBase {
  static List<Producto> productos = [];

  /// Esta función va a añadir el producto pasado por parámetros
  /// en caso de que el producto no exista
  static addProducto(Producto producto) {
    if (!productos.contains(producto)) {
      productos.add(producto);
    }
  }

  /// Esta función va a actualizar el producto pasado por parámetros
  /// por el nuevo también pasado por parámetros
  static updateProducto(Producto producto, Producto nuevoProdcuto) {
    // Obtenemos la posición del producto
    int posicion = obtenerIndex(producto);
    // Si se encuentra el producto entra
    if (posicion != -1) {
      // Actualizamos el producto localizado por el nuevo producto
      productos.replaceRange(posicion, posicion, [nuevoProdcuto]);
    }
  }

  /// Creamos una función que va a devolver el índice de
  /// un producto concreto
  static int obtenerIndex(Producto producto) {
    return productos.indexOf(producto);
  }
}
