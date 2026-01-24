import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class MenuToe extends StatefulWidget {
  const MenuToe({super.key});

  @override
  State<MenuToe> createState() => _MenuToeState();
}

class _MenuToeState extends State<MenuToe> {
  // Creamos la referencia a la collection de salas
  CollectionReference? salasReference = FirebaseFirestore.instance.collection(
    "partidas",
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Salas de juego")),
      body: salasReference == null
          ? CircularProgressIndicator()
          : StreamBuilder(
              stream: salasReference!.snapshots(),
              builder: (context, snapshot) {
                // En caso de error mostramos un texto de error
                if (snapshot.hasError) {
                  return Center(
                    child: Text(
                      "Error al cargar la información",
                      style: TextStyle(color: Colors.red, fontSize: 24),
                    ),
                  );
                  // Mientras cargan los datos
                } else if (snapshot.connectionState ==
                    ConnectionState.waiting) {
                  return CircularProgressIndicator();
                  // En caso de que no haya datos
                } else if (!snapshot.hasData) {
                  return Center(
                    child: Text(
                      "No hay datos",
                      style: TextStyle(color: Colors.red, fontSize: 24),
                    ),
                  );
                  // En caso de que salga bien
                } else {
                  return ListView.builder(
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          ListTile(
                            title: Text(
                              snapshot.data!.docs.elementAt(index).id,
                            ),
                            trailing: IconButton(
                              onPressed: () {
                                Navigator.pushNamed(
                                  context,
                                  "/juego",
                                  arguments: snapshot.data!.docs
                                      .elementAt(index)
                                      .id,
                                );
                              },
                              icon: Icon(Icons.arrow_forward_ios),
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
