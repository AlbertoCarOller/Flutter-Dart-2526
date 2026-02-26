import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tienda_online/api/Producto.dart';
import 'package:tienda_online/provider/CarritoProvider.dart';

class ProductoScreen extends StatefulWidget {
  const ProductoScreen({super.key});

  @override
  State<ProductoScreen> createState() => _ProductoScreenState();
}

class _ProductoScreenState extends State<ProductoScreen> {
  // Creamos un ScrollController
  final scrollController = ScrollController();

  // Creamos una variable para el producto
  Producto? producto;

  @override
  void initState() {
    super.initState();
    scrollController.addListener(() => print(""));
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Obtenemos el producto pasado por parámetros
    var productoVar = ModalRoute.of(context)?.settings.arguments;
    // Si el producto es null volvemos hacia atrás para que no dé error
    if (productoVar == null) {
      WidgetsBinding.instance.addPostFrameCallback(
        (_) => Navigator.pushReplacementNamed(context, "/"),
      );
      // En caso de que no se null, ya podemos castear
    } else {
      producto = productoVar as Producto;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Botón para añadir un producto al carrito
      floatingActionButton: IconButton(
        style: ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(
            Theme.of(context).brightness == Brightness.light
                ? Colors.black54
                : Colors.white54,
          ),
          foregroundColor: WidgetStatePropertyAll(
            Theme.of(context).brightness == Brightness.light
                ? Colors.white
                : Colors.black,
          ),
        ),
        // Al presionar el botón se añadirá a la lista local
        onPressed: () async {
          // En caso de que el producto sea distinto de null, se añade
          if (producto != null) {
            await context.read<CarritoProvider>().addProducto(
              producto!,
              FirebaseFirestore.instance
                  .collection("informacion")
                  .doc(FirebaseAuth.instance.currentUser!.uid),
            );
          }
        },
        icon: Icon(Icons.add_shopping_cart, size: 35),
      ),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: SingleChildScrollView(
              controller: scrollController,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Image.network(
                    producto?.image ?? "assets/images/kivonLogoSinFondo.png",
                    scale: 1.5,
                  ),
                  Padding(
                    padding: EdgeInsetsGeometry.only(bottom: 15, top: 25),
                    child: Text(
                      producto?.title ?? "No disponible",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).brightness == Brightness.light
                            ? Colors.black
                            : Colors.white,
                      ),
                    ),
                  ),
                  // Información del producto
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // El precio del producto
                        Container(
                          alignment: Alignment.centerRight,
                          child: Padding(
                            padding: const EdgeInsets.all(8),
                            child: Text(
                              "Precio: ${producto?.price ?? "No disponible"} €",
                              style: TextStyle(
                                fontSize: 16,
                                color:
                                    Theme.of(context).brightness ==
                                        Brightness.light
                                    ? Colors.black
                                    : Colors.white,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        Divider(thickness: 4),
                        // La descripción
                        Padding(
                          padding: const EdgeInsets.only(bottom: 6),
                          child: Text(
                            "Descripción:",
                            style: TextStyle(
                              fontSize: 18,
                              color:
                                  Theme.of(context).brightness ==
                                      Brightness.light
                                  ? Colors.black
                                  : Colors.white,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsGeometry.only(bottom: 20),
                          child: Text(
                            producto?.description ?? "No disponible",
                            style: TextStyle(
                              color:
                                  Theme.of(context).brightness ==
                                      Brightness.light
                                  ? Colors.black
                                  : Colors.white,
                            ),
                          ),
                        ),
                        Divider(thickness: 4),
                        // La valoración
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Estrellas: ${producto?.rating?.rate ?? "No disponible"}",
                              style: TextStyle(
                                color:
                                    Theme.of(context).brightness ==
                                        Brightness.light
                                    ? Colors.black
                                    : Colors.white,
                                fontSize: 20,
                              ),
                            ),
                            Icon(Icons.star, color: Colors.yellow.shade700,),
                          ],
                        ),
                        Divider(thickness: 4),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Votaciones: ${producto?.rating?.count ?? "No disponible"}",
                              style: TextStyle(
                                color:
                                    Theme.of(context).brightness ==
                                        Brightness.light
                                    ? Colors.black
                                    : Colors.white,
                                fontSize: 20,
                              ),
                            ),
                            Icon(Icons.people, color: Colors.blue.shade700,),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
