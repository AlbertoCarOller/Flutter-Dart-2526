import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tienda_online/api/Producto.dart';
import 'package:tienda_online/provider/CarritoProvider.dart';

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
        title: Text("Carrito"),
        backgroundColor: Colors.purple.shade200,
      ),
      body: Column(
        children: [
          ListView.builder(
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  ListTile(
                    // Botón para eliminar un stock o el producto completo si tiene 1
                    trailing: IconButton(
                      onPressed: () async {
                        await context.read<CarritoProvider>().eliminarProducto(
                          productosProvider.entries.elementAt(index).key,
                          documentReference,
                        );
                      },
                      icon: Icon(Icons.remove, color: Colors.red),
                    ),
                    title: Text(
                      productosProvider.entries.elementAt(index).key.title ??
                          "No disponible",
                    ),
                    subtitle: Text(
                      "Cantidad: ${productosProvider.entries.elementAt(index).value}",
                    ),
                  ),
                  Divider(),
                ],
              );
            },
            itemCount: productosProvider.length,
          ),
        ],
      ),
    );
  }
}
