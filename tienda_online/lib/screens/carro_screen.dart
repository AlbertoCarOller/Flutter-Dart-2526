import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CarroScreen extends StatefulWidget {
  const CarroScreen({super.key});

  @override
  State<CarroScreen> createState() => _CarroScreenState();
}

class _CarroScreenState extends State<CarroScreen> {
  // Accedemos al documento del usuario actual
  DocumentReference<Map<String, dynamic>> collectionReference =
      FirebaseFirestore.instance.doc(FirebaseAuth.instance.currentUser!.uid);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Carrito")),
      body: StreamBuilder(
        stream: collectionReference.snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Skeletonizer(
              enabled: true,
              child: ListView.builder(
                itemBuilder: (context, index) => ListTile(title: Text("Texto")),
                itemCount: 20,
              ),
            );
          } else {
            // Obtenemos los datos del document
            Map<String, dynamic> datos =
                snapshot.data!.data() as Map<String, dynamic>;
            // Obtenemos el carrito actual
            Map<String, int> carrito = datos["CarritoActual"];
            return ListView.builder(
              itemBuilder: (context, index) {
               MapEntry<String, int> producto = carrito.entries.elementAt(index);
                return ListTile(
                  // El nombre del producto
                  title: Text(producto.key),
                );
              },
              itemCount: carrito.length,
            );
          }
        },
      ),
    );
  }
}
