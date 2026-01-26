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
                            // Mostramos el estado de las salas
                            subtitle: Text(
                              ((snapshot.data!.docs.elementAt(index).data()
                                          as Map<String, dynamic>)["estado"] ??
                                      "estado desconocido")
                                  as String,
                            ),
                            trailing: IconButton(
                              // Al presionar navegamos hasta la sala, para ello pasamos el id del document
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

  /// Esta función va a asignar el jugador al campo de Firebase, en caso de que
  /// haya espacios disponibles
  Future<bool> asignarJugador(Map<String, dynamic> camposDoc) async {
    // Obtenemos los nickname de los 2 jugadores
    String nick1 = (camposDoc["jugador1"] as Map<String, dynamic>)["nickname"];
    String nick2 = (camposDoc["jugador2"] as Map<String, dynamic>)["nickname"];
  }
}
