import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tienda_online/api/Producto.dart';
import 'package:tienda_online/provider/TemaProvider.dart';

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
          backgroundColor: WidgetStatePropertyAll(Colors.black54),
          foregroundColor: WidgetStatePropertyAll(Colors.white),
        ),
        onPressed: () {},
        icon: Icon(Icons.add_shopping_cart),
      ),
      body: Center(
        child: SingleChildScrollView(
          controller: scrollController,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsetsGeometry.only(bottom: 25),
                  child: Text(
                    producto?.title ?? "No disponible",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color:
                          context.watch<TemaProvider>().temaActual ==
                              ThemeMode.light
                          ? Colors.black
                          : Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Stack(
                  children: [
                    Image.network(
                      producto?.image ?? "assets/images/kivonLogoSinFondo.png",
                      scale: 1,
                    ),
                    Positioned(
                      bottom: 1,
                      right: 0,
                      left: 0,
                      child: Container(
                        color:
                            context.watch<TemaProvider>().temaActual ==
                                ThemeMode.light
                            ? Colors.black54
                            : Colors.white54,
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: Text(
                            "Precio: ${producto?.price ?? "No disponible"} €",
                            style: TextStyle(
                              fontSize: 16,
                              color:
                                  context.watch<TemaProvider>().temaActual ==
                                      ThemeMode.light
                                  ? Colors.white
                                  : Colors.black,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Container(
                    alignment: Alignment.centerLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 6),
                          child: Text(
                            "Descripción:",
                            style: TextStyle(
                              fontSize: 18,
                              color:
                                  context.watch<TemaProvider>().temaActual ==
                                      ThemeMode.light
                                  ? Colors.black
                                  : Colors.white,
                            ),
                          ),
                        ),
                        Text(
                          producto?.description ?? "No disponible",
                          style: TextStyle(
                            color:
                                context.watch<TemaProvider>().temaActual ==
                                    ThemeMode.light
                                ? Colors.black
                                : Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
