import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:tienda_online/api/conexion_api.dart';
import 'package:tienda_online/provider/CarritoProvider.dart';
import 'package:tienda_online/provider/TemaProvider.dart';

import '../api/Producto.dart';

class TiendaScreen extends StatefulWidget {
  const TiendaScreen({super.key});

  @override
  State<TiendaScreen> createState() => _TiendaScreenState();
}

// TODO: hacer cambios visuales para hacerlo más bonita
class _TiendaScreenState extends State<TiendaScreen> {
  // Creamos una variable que va a almacenar los productos desde la API
  // Hacemos la lista Future para que se puedan cargar los datos en el initState()
  late Future<List<Producto>> productos;

  // Creamos una variable para saber si hay un ChoiceChip activado
  bool hayCategoria = false;

  // Creamos una variable que va a alamcenar la categoría actual
  String categoriaActual = "";

  // Creamos el ScrollController
  ScrollController scrollController = ScrollController();

  // Creamos una variable que va almacenar el tema actual

  // Creamos un initState para cargar el mapa de prductos
  @override
  void initState() {
    super.initState();
    // Cargamos los productos de la API
    productos = ConexionApi.cargarProductos();
    // Mergeamos los datos de firebase a productos reales
    context.read<CarritoProvider>().mergeCarritoToLocal(
      productos,
      FirebaseFirestore.instance
          .collection("informacion")
          .doc(FirebaseAuth.instance.currentUser?.uid ?? ""),
    );
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
      // Le ponemos Badge para que nos salga los número de notificaciones, en este caso el número de productos en el carrito
      floatingActionButton: Badge(
        backgroundColor: Colors.red,
        textColor: Colors.white,
        label: Text(
          context
              .watch<CarritoProvider>()
              .productos
              .values
              .fold(0, (previousValue, element) => previousValue + element)
              .toString(),
        ),
        child: IconButton(
          style: ButtonStyle(
            backgroundColor: WidgetStatePropertyAll(Colors.black54),
            foregroundColor: WidgetStatePropertyAll(Colors.white),
          ),
          // Navegamos hasta la pantalla del carrito
          onPressed: () async {
            // Obtenemos el id actual del usuario
            String uid = FirebaseAuth.instance.currentUser?.uid ?? "";
            // Cargamos el carro de firebase en local
            await context.read<CarritoProvider>().mergeCarritoToLocal(
              productos,
              FirebaseFirestore.instance.collection("informacion").doc(uid),
            );
            Navigator.pushNamed(context, "/carro_screen");
          },
          icon: Icon(Icons.shopping_bag_rounded, size: 35),
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Image.asset("assets/images/kivonLogoSinFondo.png", scale: 4),
        actions: [
          IconButton(
            // Al presionar el botón se mostrará un Dialog para cerrar sesión
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    backgroundColor: Colors.purple.shade400,
                    title: Text(
                      "¿Seguro que quieres cerrar sesión?",
                      style: TextStyle(color: Colors.white),
                    ),
                    actions: [
                      TextButton(
                        onPressed: () async {
                          // Comprobamos que siga en el stack de screens
                          if (mounted) {
                            // Cerramos la sesión, gracias al flujo de Usuarios, viajaremos automáticamente hacia el inicio
                            await FirebaseAuth.instance.signOut();
                            // Cerramos el Dialog
                            Navigator.pop(this.context);
                          }
                        },
                        child: Text(
                          "Sí",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          "No",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  );
                },
              );
            },
            icon: Icon(Icons.logout, color: Colors.black),
          ),
        ],
        // Para cambiar de color del tema
        leading: kIsWeb
            ? IconButton(
                onPressed: () {
                  // Cambiamos el color del tema con read, este sirve para llamar funciones y demás
                  context.read<TemaProvider>().cambiarTema();
                },
                icon: Icon(
                  // Dependiendo del modo en el que esté muestra un icono u otro
                  Theme.of(context).brightness == Brightness.light
                      ? Icons.dark_mode
                      : Icons.light_mode,
                  color: Colors.black,
                ),
              )
            : null,
      ),
      // FutureBuilder para indicar que el bloque (el GridView) debe aparecer cuando haya cargado 'cargarProductos'
      body: Column(
        children: [
          // Este FutureBuilder corresponde a la elección de la categoría
          Expanded(
            child: FutureBuilder(
              future: productos,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Skeletonizer(
                    enabled: true,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: List.generate(
                          8,
                          (index) => TextButton(
                            onPressed: () {},
                            child: Text("Categoría"),
                          ),
                        ),
                      ),
                    ),
                  );
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text(
                      "Error al cargar categorías (Problemas de conexión)",
                      style: TextStyle(color: Colors.red),
                    ),
                  );
                } else if (snapshot.hasData) {
                  // Creamos una lista que va a almacenar todas las categorías no repetidas
                  List<String> listCategorias = snapshot.data!
                      .map((e) => e.category ?? "")
                      .where((element) => element.isNotEmpty)
                      .toSet()
                      .toList();
                  return SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    controller: scrollController,
                    child: Row(
                      spacing: 2,
                      children: [
                        // Transformamos a un Set la lista para quedarnos con los no repetidos
                        for (int i = 0; i < listCategorias.length; i++)
                          // Es como TextButton con un formato de elección
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: ChoiceChip(
                              showCheckmark: false,
                              label: Text(
                                listCategorias.elementAt(i),
                                style: TextStyle(
                                  // Controlamos el color dependiendo del modo (oscuro/claro)
                                  color:
                                      categoriaActual ==
                                              listCategorias.elementAt(i) &&
                                          Theme.of(context).brightness ==
                                              Brightness.light
                                      ? Colors.white
                                      : null,
                                ),
                              ),
                              selected:
                                  categoriaActual ==
                                  listCategorias.elementAt(i),
                              onSelected: (value) {
                                // Si la categoria actual es distinta a la que se quiere seleccionar entra
                                if (listCategorias.elementAt(i) !=
                                    categoriaActual) {
                                  // Se cambia la categoria actual
                                  setState(() {
                                    categoriaActual = listCategorias.elementAt(
                                      i,
                                    );
                                  });
                                  // En caso de que sea la misma categoría, se quita
                                } else {
                                  setState(() {
                                    categoriaActual = "";
                                  });
                                }
                              },
                              selectedColor: Color(0xFF7E008F),
                            ),
                          ),
                      ],
                    ),
                  );
                } else {
                  return Center(
                    child: Text(
                      "No hay categotías",
                      style: TextStyle(color: Colors.red),
                    ),
                  );
                }
              },
            ),
          ),
          Expanded(
            flex: 10,
            // FutureBuilder que corresponde al GridView de los productos
            child: FutureBuilder(
              // A future le indicamos que se va a construir cuando termine 'cargarProductos'
              future: productos,
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
                      itemBuilder: (context, index) => SizedBox(
                        width: 300,
                        height: 400,
                      ),
                    ),
                  );
                  // En caso de que hayan cargado los datos se muestra el GridView de los productos
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text(
                      "Error al cargar los productos (Error de conexión)",
                      style: TextStyle(color: Colors.red),
                    ),
                  );
                } else if (snapshot.hasData) {
                  List<Producto> productosPorCategoria = snapshot.data!.where((
                    element,
                  ) {
                    if (categoriaActual.isEmpty) {
                      return true;
                    }
                    return categoriaActual == element.category!;
                  }).toList();
                  return GridViewProducts(productos: productosPorCategoria);
                } else {
                  return Center(
                    child: Text(
                      "No hay prodcutos",
                      style: TextStyle(color: Colors.red),
                    ),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
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
        return GestureDetector(
          // Navegamos a la pantalla del producto concreto
          onTap: () => Navigator.pushNamed(
            context,
            "/producto_screen",
            arguments: productos.elementAt(index),
          ),
          child: Container(
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
                  // Positiones.fill() -> Crea un Positioned con todos los lados a 0, queda en el centro
                  Positioned.fill(
                    // BoxFit.contain -> Ocupa el espacio completo del Container sin deformarse
                    child: Image.network(
                      productos[index].image!,
                      fit: BoxFit.contain,
                    ),
                  ),
                  Positioned(
                    bottom: 1,
                    right: 0,
                    left: 0,
                    child: Container(
                      color: Colors.black54,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 4,
                          vertical: 4,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              productos[index].title!,
                              style: TextStyle(
                                color: Colors.white,
                                // extOverflow.ellipsis -> Hace que cuando haya overflow se pongan '...'
                                overflow: TextOverflow.ellipsis,
                              ),
                              // El máximo de líneas que puede ocupar el texto
                              maxLines: 1,
                            ),
                            Text(
                              "${productos[index].price!} €",
                              // extOverflow.ellipsis -> Hace que cuando haya overflow se pongan '...'
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                              maxLines: 1,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
      itemCount: productos.length,
    );
  }
}
