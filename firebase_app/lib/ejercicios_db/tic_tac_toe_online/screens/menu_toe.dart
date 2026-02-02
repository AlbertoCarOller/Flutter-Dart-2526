import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_app/ejercicios_db/tic_tac_toe_online/data/data_singleton.dart';
import 'package:flutter/material.dart';

class MenuToe extends StatefulWidget {
  const MenuToe({super.key});

  @override
  State<MenuToe> createState() => _MenuToeState();
}

class _MenuToeState extends State<MenuToe> {
  // Llamamos a el singleton de datos para acceder al nickname del jugador
  DataSingleton dataSingleton = DataSingleton();

  // Creamos la referencia a la collection de salas
  CollectionReference? salasReference = FirebaseFirestore.instance.collection(
    "partidas",
  );

  // Creamos una variable que va a indicar que número de jugador somos
  int? numJugador;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Salas de juego",
          // semanticsLabel -> lee lo que está en este apartado
          semanticsLabel: "Estás en el menú de las salas de juegos",
        ),
      ),
      body: salasReference == null
          ? CircularProgressIndicator()
          : StreamBuilder(
              stream: salasReference!.snapshots(),
              builder: (contextS, snapshot) {
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
                      Map<String, dynamic> campos =
                          snapshot.data!.docs.elementAt(index).data()
                              as Map<String, dynamic>;
                      return Column(
                        children: [
                          ListTile(
                            title: Text(
                              snapshot.data!.docs.elementAt(index).id,
                            ),
                            // Mostramos el estado de las salas
                            subtitle: Text(
                              (campos["estado"] ?? "estado desconocido")
                                  as String,
                            ),
                            trailing: IconButton(
                              // Al presionar navegamos hasta la sala, para ello pasamos el id del document
                              onPressed: () async {
                                // En caso de que la sala no esté llena y esté la pantalla activa
                                if (!await asignarJugador(
                                      campos,
                                      snapshot.data!.docs
                                          .elementAt(index)
                                          .reference,
                                    ) &&
                                    contextS.mounted &&
                                    ModalRoute.of(contextS)!.isCurrent) {
                                  await Navigator.pushNamed(
                                    contextS,
                                    "/juego",
                                    arguments: snapshot.data!.docs
                                        .elementAt(index)
                                        .id,
                                    /* Cuando volvemos, es decir salimos de la sala borramos
                                     el nombre y cambiamos el estado de la sala */
                                  ).then((_) async {
                                    // Borramos el nickname del jugador
                                    await snapshot.data!.docs
                                        .elementAt(index)
                                        .reference
                                        .update({
                                          "jugador$numJugador": {
                                            "nickname": "",
                                          },
                                        });
                                    // Cambiamos el estado de la sala
                                    await snapshot.data!.docs
                                        .elementAt(index)
                                        .reference
                                        .update({"estado": "esperando"});
                                  });
                                }
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
  /// haya espacios disponibles, devolverá true o false dependiendo de si hay
  /// jugadores (espacio completo) o no está completo todavía
  Future<bool> asignarJugador(
    Map<String, dynamic> camposDoc,
    DocumentReference<Object?> doc,
  ) async {
    // Obtenemos los nickname de los 2 jugadores
    String nick1 = (camposDoc["jugador1"] as Map<String, dynamic>)["nickname"];
    String nick2 = (camposDoc["jugador2"] as Map<String, dynamic>)["nickname"];
    // Comprobamos si el nickname del primer jugador no existe
    if (nick1.isEmpty) {
      // Asiganamos al valor local el número de jugador que somos
      numJugador = 1;
      // Actaulizamos el valor del índice del usuario en el singleton
      dataSingleton.indexUser = 1;
      // Actualizamos el nombre del jugador 1
      await doc.update({
        "jugador1": {"nickname": dataSingleton.nickname},
      });
      /* Actualizamos el turno, debemos de hacerlo aquí, ya que en la pantalla
       del juego al hacer las comprobaciones no le da tiempo a flutter recibir
        el update en el tiempo que se nencesita para que la app funcione bien */
      await doc.update({"turno": dataSingleton.nickname});
      // En caso de que el jugador 2 exista, la sala estará llena
      if (nick2.isNotEmpty) {
        // Cambiamos el estado de la sala
        await doc.update({"estado": "sala llena"});
      }
      // En caso de que el nick del jugador 2 esté vacío y el del jugador 1 no entra
    } else if (nick2.isEmpty) {
      // Asiganamos al valor local el número de jugador que somos
      numJugador = 2;
      // Actaulizamos el valor del índice del usuario en el singleton
      dataSingleton.indexUser = 2;
      // Actualizamos el nombre del jugador 2
      await doc.update({
        "jugador2": {"nickname": dataSingleton.nickname},
      });
      /* Cambiamos el estado de la sala, porque ya sabemos que 1 no está vacío y
      * ahora 2 tampoco */
      await doc.update({"estado": "sala llena"});
      // En caso de que los dos estén llenos
    } else {
      return true;
    }
    return false;
  }
}
