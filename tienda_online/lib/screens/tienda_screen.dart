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

  // Creamos un initState para cargar el mapa de prductos
  @override
  void initState() {
    super.initState();
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
      body: FutureBuilder(
        future: cargarProductos(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Skeletonizer(
              enabled: true,
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisSpacing: 2,
                  crossAxisCount: 5,
                ),
                itemBuilder: (context, index) => Container(),
              ),
            );
          } else {
            return GridViewProducts(productos: productos);
          }
        },
      ),
    );
  }

  /// Esta función va a cargar los productos en una lista
  /// desde la API
  Future<void> cargarProductos() async {
    // Primero mediante la URL cargamos en un mapa los datos de la API
    final response = await http.get(
      Uri.parse("https://fakestoreapi.com/products"),
    );
    // Si la respuesta de la API es correcta cargamos el map
    if (response.statusCode == 200) {
      // Cargamos el JSON en una lista porque empieza por '[]' la API
      List<dynamic> list = jsonDecode(response.body);
      // Recorremos la lista de mapas, cada mapa es un producto
      productos = list.map((e) => Producto.fromJson(e)).toList();

      print(productos);
    }
  }
}

/// El GridViw que contien los productos cargados de la API
class GridViewProducts extends StatelessWidget {
  const GridViewProducts({super.key, required this.productos});

  final List<Producto> productos;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisSpacing: 2,
        crossAxisCount: 3,
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Cargamos la imagen del prodcuto, en caso de que no esté aún cargamos el fondo
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Image.network(
                  productos[index].image ??
                      "assets/images/kivonLogoSinFondo.png",
                  scale: 6,
                ),
              ),
              Text(
                productos[index].title ?? "No disponible",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 12),
              ),
              // El precio del produto
              Text(
                "Precio: ${productos[index].price ?? "No disponible"}",
                style: TextStyle(fontSize: 14),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        );
      },
      itemCount: productos.length,
    );
  }
}
