import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class MenuEncuestas extends StatefulWidget {
  const MenuEncuestas({super.key});

  @override
  State<MenuEncuestas> createState() => _MenuEncuestasState();
}

class _MenuEncuestasState extends State<MenuEncuestas> {
  // Obtenemos la referencia a la colección de encuestas, que contiene todas las encuestas
  CollectionReference encuestasReference = FirebaseFirestore.instance
      .collection("encuestas");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Encuestas"),
        backgroundColor: Colors.orange.shade300,
        centerTitle: true,
        actions: [
          IconButton(
            // Al pulsar llevará a una pantalla para crear una encuesta
            onPressed: () {
              Navigator.pushNamed(
                context,
                "/crear",
                arguments: encuestasReference,
              );
            },
            icon: Icon(Icons.add_circle_outline_rounded),
          ),
        ],
      ),
      body: StreamBuilder(
        stream: encuestasReference.snapshots(),
        builder: (context, snapshot) {
          // Si da error entra
          if (snapshot.hasError) {
            // Se muestra un mensaje de error
            return Text(
              "Error",
              style: TextStyle(color: Colors.red, fontSize: 24),
            );
            // En caso de que no hayan cargado los datos entra
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            // Mostramos un widget de carga
            return CircularProgressIndicator();
            // En caso de que hayan cargado los datos entra
          } else {
            // Los datos se mostrarán en un ListView, los docs que hay en la colección 'encuestas'
            return ListView.builder(
              itemBuilder: (context, index) {
                // Guardamos el id del document, para posteriormente acceder
                String docId = snapshot.data!.docs.elementAt(index).id;
                // Hacemos una columna, que va a contener las ListView y un Divider
                return Column(
                  children: [
                    ListTile(
                      title: Text(docId.toUpperCase()),
                      trailing: IconButton(
                        // Al pulsar, navegamos a la encuesta concreta, pasándole el id
                        onPressed: () {
                          Navigator.pushNamed(
                            context,
                            "/encuesta",
                            arguments: docId,
                          );
                        },
                        icon: Icon(Icons.chevron_right),
                      ),
                    ),
                    Divider(),
                  ],
                );
              },
              itemCount: snapshot.data!.docs.length,
            );
          }
        },
      ),
    );
  }
}
