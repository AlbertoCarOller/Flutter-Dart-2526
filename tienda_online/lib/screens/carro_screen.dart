import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tienda_online/api/Producto.dart';
import 'package:tienda_online/provider/CarritoProvider.dart';
import 'package:tienda_online/provider/TemaProvider.dart';

class CarroScreen extends StatefulWidget {
  const CarroScreen({super.key});

  @override
  State<CarroScreen> createState() => _CarroScreenState();
}

class _CarroScreenState extends State<CarroScreen> {
  // Accedemos al documento del usuario actual
  DocumentReference<Map<String, dynamic>> documentReference = FirebaseFirestore
      .instance
      .collection("informacion")
      .doc(FirebaseAuth.instance.currentUser!.uid);

  @override
  Widget build(BuildContext context) {
    // Escuchamos los cambios del mapa de prodcutos
    Map<Producto, int> productosProvider = context
        .watch<CarritoProvider>()
        .productos;
    return Scaffold(
      appBar: AppBar(
        title: Text("Carrito", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.purple.shade400,
      ),
      body: productosProvider.isNotEmpty
          ? Column(
              children: [
                Expanded(
                  flex: 4,
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Card(
                            color: Colors.white12,
                            elevation: 2,
                            child: ListTile(
                              // Botón para eliminar un stock o el producto completo si tiene 1
                              trailing: IconButton(
                                onPressed: () async {
                                  await context
                                      .read<CarritoProvider>()
                                      .eliminarProducto(
                                        productosProvider.entries
                                            .elementAt(index)
                                            .key,
                                        documentReference,
                                      );
                                },
                                icon: Icon(Icons.remove, color: Colors.red),
                              ),
                              title: Text(
                                productosProvider.entries
                                        .elementAt(index)
                                        .key
                                        .title ??
                                    "No disponible",
                              ),
                              subtitle: Text(
                                "Cantidad: ${productosProvider.entries.elementAt(index).value}",
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                    itemCount: productosProvider.length,
                  ),
                ),
                // Aquí está el contenedor con el total y el botón de comprar
                Container(
                  decoration: BoxDecoration(
                    border: Border(top: BorderSide(color: Colors.purple.shade400))
                  ),
                  alignment: Alignment.center,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 10, top: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          // toStringAsFixed() -> Deja los decimales que indicamos
                          "Total: ${productosProvider.entries.map((e) => (e.key.price ?? 0) * e.value).fold(0.0, (previousValue, element) => previousValue + element).toStringAsFixed(2)} €",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color:
                                context.watch<TemaProvider>().temaActual ==
                                    ThemeMode.light
                                ? Colors.black
                                : Colors.white,
                          ),
                        ),
                        TextButton(
                          style: ButtonStyle(
                            backgroundColor: WidgetStatePropertyAll(
                              Colors.purple.shade400,
                            ),
                            foregroundColor: WidgetStatePropertyAll(
                              Colors.white,
                            ),
                          ),
                          // Eliminamos todos los productos al comprar
                          onPressed: () async {
                            await context
                                .read<CarritoProvider>()
                                .eliminarProductos(documentReference);
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(6),
                            child: Text(
                              "Comprar",
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )
          // En caso de que no haya productos en el carrito
          : Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.report_problem_outlined,
                    color: Colors.red,
                    size: 40,
                  ),
                  Text(
                    "No hay nada en el carrito",
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
    );
  }
}
