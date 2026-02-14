import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:skeletonizer/skeletonizer.dart';
import 'package:tienda_online/data/Producto.dart';

class TiendaScreen extends StatefulWidget {
  const TiendaScreen({super.key});

  @override
  State<TiendaScreen> createState() => _TiendaScreenState();
}

class _TiendaScreenState extends State<TiendaScreen> {
  // Creamos una variable que va a almacenar los productos desde la API
  List<Producto> productos = [];

  // Creamos una variable que va a alamcenar la categoría actual
  String categoriaActual = "";

  // Creamos el ScrollController
  ScrollController scrollController = ScrollController();

  // Creamos un initState para cargar el mapa de prductos
  @override
  void initState() {
    super.initState();
    scrollController.addListener(() => print(scrollController.position.pixels));
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // FloatingActionButton, botón flotante en la parte derecha izquierda
      floatingActionButton: IconButton(
        style: ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(Colors.black54),
          foregroundColor: WidgetStatePropertyAll(Colors.white),
        ),
        onPressed: () {},
        icon: Icon(Icons.shopping_bag_rounded),
      ),
      appBar: AppBar(
        title: Image.asset("assets/images/kivonLogoSinFondo.png", scale: 4),
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.filter_alt_rounded),
        ),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.person))],
      ),
      // FutureBuilder para indicar que el bloque (el GridView) debe aparecer cuando haya cargado 'cargarProductos'
      body: Column(
        children: [
          FutureBuilder(
            // A future le indicamos que se va a construir cuando termine 'cargarProductos'
            future: cargarProductos(categoriaActual),
            builder: (context, snapshot) {
              // Si aún está esperando se muestra el Skeletonizer
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Skeletonizer(
                  // Se muestra el efecto
                  enabled: true,
                  // Se muestra el esquema de un GridView
                  child: GridView.builder(
                    itemCount: 20,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisSpacing: 2,
                      crossAxisCount: 5,
                    ),
                    itemBuilder: (context, index) => Container(),
                  ),
                );
                // En caso de que hayan cargado los datos se muestra el GridView de los productos
              } else {
                return GridViewProducts(productos: productos);
              }
            },
          ),
          FutureBuilder(
            future: cargarProductos(categoriaActual),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Skeletonizer(
                  enabled: true,
                  child: Row(
                    children: List.generate(
                      8,
                      (index) => TextButton(onPressed: () {}, child: Text("")),
                    ),
                  ),
                );
              } else {
                // Creamos una lista que va a almacenar todas las categorías no repetidas
                List<String> listCategorias = productos
                    .map((e) => e.category ?? "")
                    .where((element) => element.isNotEmpty)
                    .toSet()
                    .toList();
                return SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  controller: scrollController,
                  child: Row(
                    spacing: 4,
                    children: [
                      // Al presional el botón cambiamos la categoría actual
                      TextButton(
                        onPressed: () {
                          categoriaActual = "";
                        },
                        child: Text("Todos"),
                      ),
                      // Transformamos a un Set la lista para quedarnos con los no repetidos
                      for (int i = 0; i < listCategorias.length; i++)
                        TextButton(
                          // Al presionar filtra por categoría los productos
                          onPressed: () {
                            setState(() {
                              categoriaActual = listCategorias.elementAt(i);
                            });
                          },
                          child: Text(listCategorias.elementAt(i)),
                        ),
                    ],
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }

  /// Esta función va a cargar los productos en una lista
  /// desde la API
  Future<void> cargarProductos(String categoria) async {
    // Primero mediante la URL cargamos en un mapa los datos de la API
    final response = await http.get(
      Uri.parse("https://fakestoreapi.com/products"),
    );
    // Si la respuesta de la API es correcta cargamos el map
    if (response.statusCode == 200) {
      // Cargamos el JSON en una lista porque empieza por '[]' la API
      List<dynamic> list = jsonDecode(response.body);
      // Recorremos la lista de mapas, cada mapa es un producto
      // En caso de que la categoría este vacía, se muestran todos los productos
      if (categoria.isEmpty) {
        productos = list.map((e) => Producto.fromJson(e)).toList();
        // En caso de que haya categoría se muestran las de esa categoría
      } else {
        productos = list
            .map((e) => Producto.fromJson(e))
            .where((element) => element.category == categoria)
            .toList();
      }

      print(productos);
    }
  }
}

/// El GridViw que contiene los productos cargados de la API
class GridViewProducts extends StatelessWidget {
  const GridViewProducts({super.key, required this.productos});

  final List<Producto> productos;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 300,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        mainAxisExtent: 400,
      ),

      itemBuilder: (context, index) {
        return Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [Colors.grey.shade300, Colors.purple.shade600],
            ),
          ),
          child: Padding(
            padding: EdgeInsetsGeometry.all(10),
            child: Stack(
              children: [
                Center(child: Image.network(productos[index].image!, scale: 3)),
                Text(productos[index].title!),
                Positioned(
                  bottom: 1,
                  right: 1,
                  child: Text("${productos[index].price!} €"),
                ),
              ],
            ),
          ),
        );
      },
      itemCount: productos.length,
    );
  }
}
