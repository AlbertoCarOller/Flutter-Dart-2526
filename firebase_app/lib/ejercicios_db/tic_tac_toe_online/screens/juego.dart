import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_app/ejercicios_db/logica_juego/logica_juego.dart';
import 'package:firebase_app/ejercicios_db/tic_tac_toe_online/data/data_singleton.dart';
import 'package:flutter/material.dart';

class Juego extends StatefulWidget {
  const Juego({super.key});

  @override
  State<Juego> createState() => _JuegoState();
}

class _JuegoState extends State<Juego> {
  // Creamos una variable donde vamos a guardar el id del documento
  String docId = "";

  // Creamos la variable que va a contener la referencia al document
  DocumentReference? documentReference;

  // Creamos una variable para almacenar el índice del ganador
  int indexGanador = 0;

  // Creamos una variable que va a bloquear el onTap() mientras se procesan las funciones async
  bool procesandoOnTap = false;

  // Cargamos la clase con los datos
  DataSingleton data = DataSingleton();

  // Creamos un scrollController para permitir scroll para aumentar la accesibilidad
  final sc = ScrollController();

  // Cargamos los datos
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Obtenemos el id del documento pasado por argumentos
    docId = (ModalRoute.of(context)!.settings.arguments ?? "") as String;
    // En caso de que no haya docId entra
    if (docId.isEmpty) {
      /* Navegamos a la ruta padre, creamos una instancia de WidgetsBinding,
      * llamamos a la función addPostFrameCallback() que significa que cuando
      * termine de cargar la panatalla (dibujarla) haz la acción pasada por
      * parámetros, en este caso navega a la raíz remplazando la ruta actual */
      WidgetsBinding.instance.addPostFrameCallback(
        (_) => Navigator.pushReplacementNamed(context, "/"),
      );
      // En caso de que haya docId, cargamos la referencia al document
    } else {
      // Cargamos la referencia al document
      documentReference = FirebaseFirestore.instance
          .collection("partidas")
          .doc(docId);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(docId)),
      body: documentReference == null
          ? Text(
              "No se encuentra la sala",
              style: TextStyle(color: Colors.red, fontSize: 25),
            )
          : StreamBuilder(
              stream: documentReference!.snapshots(),
              builder: (context, snapshot) {
                // En caso de error
                if (snapshot.hasError) {
                  return Text(
                    "Error",
                    style: TextStyle(color: Colors.red, fontSize: 25),
                  );
                  // En caso de que aún no hayan cargado los datos
                } else if (snapshot.connectionState ==
                    ConnectionState.waiting) {
                  return CircularProgressIndicator();
                  // En caso de que no haya datos o de que el document no exista
                } else if (!snapshot.hasData || !snapshot.data!.exists) {
                  return Text(
                    "Error",
                    style: TextStyle(color: Colors.red, fontSize: 25),
                  );
                  // En caso de que salga bien
                } else {
                  // Obtenemos el mapa de los campos
                  Map<String, dynamic> campos =
                      snapshot.data!.data() as Map<String, dynamic>;
                  // Obtenemos los mapas de los jugadores
                  Map<String, dynamic> jugador1 =
                      campos["jugador1"] as Map<String, dynamic>;
                  Map<String, dynamic> jugador2 =
                      campos["jugador2"] as Map<String, dynamic>;
                  // Obtenemos los datos del tablero
                  List<int> tablero = List.from(campos["tablero"]);
                  return SingleChildScrollView(
                    // Hacemos scrollabe la pantalla de juego por si aumenta el tamaño de la fuente
                    controller: sc,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 40),
                            // Mostramos el texto con el turno que corresponda
                            child: Text(
                              hayJugadores(jugador1, jugador2)
                                  ? "Turno de ${campos["turno"]}"
                                  : "Esperando rival...",
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.blue.shade400,
                              ),
                            ),
                          ),
                          // La GridView, el tablero de juego
                          SizedBox(
                            width: 250,
                            height: 250,
                            child: GridView.builder(
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 3,
                                  ),
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  child: Card(
                                    color: Colors.blue.shade200,
                                    // Comprobamos si está marcada o no por ek jugador 1 para poner un círculo
                                    child: tablero.elementAt(index) == 1
                                        ? Icon(
                                            Icons.circle_outlined,
                                            color: Colors.white,
                                          )
                                        // En caso de que el tablero en ese índice tenga 2 se marca con x
                                        : tablero.elementAt(index) == 2
                                        ? Icon(Icons.clear, color: Colors.white)
                                        : Text(""),
                                  ),
                                  // Al pulsar se marca
                                  onTap: () async {
                                    /* Comprobamos que no se pueda hacer onTap(), comprobamos
                                    * si la casilla ya está marcada o si aún se está procesando
                                    * el onTap() ya que si aún las funciones asíncronas no han terminado
                                    * no voy a dejar al usuario que vuelva a pulsar, antes deben de
                                    * completarse los datos, aparte comrpobamos que estén los dos
                                    * jugadores en la sala */
                                    if (tablero.elementAt(index) != 0 &&
                                        procesandoOnTap &&
                                        ((jugador1["nickname"] ?? "") as String)
                                            .isNotEmpty &&
                                        ((jugador2["nickname"] ?? "") as String)
                                            .isNotEmpty) {}
                                    // Comprobamos si hay ganador, en caso de que sí, tras pulsar se borra el mensaje y el ganador
                                    if (indexGanador != 0) {
                                      // Borramos el ganador de firebase
                                      await snapshot.data!.reference.update({
                                        "ganador": "",
                                      });
                                    }
                                    // Si el usuario es el que aparece en el turno podrá pulsar
                                    if (data.nickname == campos["turno"]) {
                                      // Enpezamos a procesar los datos
                                      procesandoOnTap = true;
                                      // Marcamos el índice y guardamos el índice del ganador
                                      indexGanador = await marcarCasilla(
                                        tablero,
                                        index,
                                        snapshot.data!.reference,
                                      );
                                      // Comprobamos si hay ganador
                                      await declararGanador(
                                        snapshot.data!,
                                        tablero,
                                      );
                                      // Cambiamos de turno una vez que el jugador ha pulsado
                                      await cambioDeTurno(
                                        campos,
                                        jugador2["nickname"],
                                        jugador1["nickname"],
                                        snapshot.data!.reference,
                                      );
                                      // Una vez se han proceso los datos cambiamos
                                      procesandoOnTap = false;
                                    }
                                  },
                                );
                              },
                              // El tamaño de la lista (del tablero)
                              itemCount: tablero.length,
                            ),
                          ),
                          // Texto que muestra si hay ganador
                          Padding(
                            padding: const EdgeInsets.only(top: 40),
                            child: Text(
                              ((campos["ganador"] ?? "") as String).isEmpty
                                  ? ""
                                  : "Felicidades ${campos["ganador"]} has ganado!!🎉",
                              style: TextStyle(color: Colors.blue.shade400),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }
              },
            ),
    );
  }

  /// Esta función va cambiar el turno
  /// del usuario al pulsar una casilla
  Future<void> cambioDeTurno(
    Map<String, dynamic> campos,
    String nick2,
    String nick1,
    DocumentReference docRef,
  ) async {
    // Si el turno es del usuario, se cambia al del oponente
    if (campos["turno"] == data.nickname) {
      await docRef.update({"turno": data.nickname == nick1 ? nick2 : nick1});
      // En caso de que sea del oponente, se pone el del usuario
    } else {
      await docRef.update({"turno": data.nickname});
    }
  }

  /// Esta función va a marcar la casilla que el usuario pulse, se actualizará
  /// el el tablero de la base de datos y marca quien es el ganador
  Future<int> marcarCasilla(
    List<int> tablero,
    int indexMarcar,
    DocumentReference doc,
  ) async {
    // Modificamos el tablero anterior
    // tableroAnterior.replaceRange(indexMarcar, indexMarcar + 1, [data.indexUser]); -> el end no lo incluye
    tablero[indexMarcar] = data.indexUser; // Sustituye el valor
    await doc.update({"tablero": tablero});
    // Ahora comprobamos quién es el ganador y devolvemos su index
    return LogicaJuego.comprobarGanador(tablero);
  }

  /// Esta función va a actualizar el campo del ganador para
  /// mostrar por pantalla y terminar la partida borrando las marcas
  /// del tablero
  Future<void> declararGanador(
    DocumentSnapshot<Object?> doc,
    List<int> tablero,
  ) async {
    if (indexGanador != 0) {
      // Declaramos al ganador actualizando este campo
      await doc.reference.update({
        "ganador":
            ((doc.data()
                as Map<String, dynamic>)["jugador$indexGanador"])["nickname"],
      });
      // Borramos las marcas del tablero
      await doc.reference.update({"tablero": tablero.map((e) => 0).toList()});
    }
  }
}

/// Esta función va a comprobar si están ya los dos jugadores en la sala,
/// en caso de que sí, devuelve un true, en caso de que no devuelve un false
bool hayJugadores(
  Map<String, dynamic> jugador1,
  Map<String, dynamic> jugador2,
) {
  // Accedemos al campo del nickname de los dos jugadores para ver si hay
  return (jugador1["nickname"] as String).isNotEmpty &&
      (jugador2["nickname"] as String).isNotEmpty;
}
