import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skeletonizer/skeletonizer.dart';
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
      appBar: AppBar(title: Text("Carrito")),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(
              productosProvider.entries.elementAt(index).key.title ??
                  "No disponible",
            ),
            subtitle: Text(
              "Cantidad: ${productosProvider.entries.elementAt(index).value}",
            ),
          );
        },
        itemCount: productosProvider.length,
      ),
    );
  }
}
