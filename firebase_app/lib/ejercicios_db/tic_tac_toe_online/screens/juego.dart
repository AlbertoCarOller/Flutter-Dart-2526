import 'package:cloud_firestore/cloud_firestore.dart';
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

  // Cargamos la clase con los datos
  DataSingleton data = DataSingleton();

  // Una lista que guarda el índice las casillas marcadas por el usuario (nosotros)
  List<int> marcadasPorTi = [];

  // Una lista que guarda el índice de las casillas marcadas por el oponente
  List<int> marcadasOponente = [];

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
                  return Center(
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
                                  // Comprobamos si está marcada o no
                                  child: marcadasPorTi.contains(index)
                                      ? Icon(
                                          Icons.circle_outlined,
                                          color: Colors.white,
                                        )
                                      : marcadasOponente.contains(index)
                                      ? Icon(Icons.clear, color: Colors.white)
                                      : Text(""),
                                ),
                                // Al pulsar se marca
                                onTap: () {
                                  // Comprobamos que no haya sido pulsado antes
                                  if (marcadasPorTi.contains(index) ||
                                      marcadasOponente.contains(index)) {
                                    // Guaramos el índice
                                    marcadasPorTi.add(index);
                                    // TODO: seguramente se tenga que quitar
                                    // TODO: preguntar al maestro porque tarda en construirse
                                    setState(() {});
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
                  );
                }
              },
            ),
    );
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
