import 'package:deint/ejercicios_interfaz_usuario/la_expedicion_perdida/modal/expedicion_data.dart';
import 'package:flutter/material.dart';

class JuegoExpedicion extends StatefulWidget {
  const JuegoExpedicion({super.key});

  @override
  State<JuegoExpedicion> createState() => _JuegoExpedicionState();
}

class _JuegoExpedicionState extends State<JuegoExpedicion> {
  // Creamos un scrollController, IMPORTANTE, ESTOS SOLO FUNCIONAN EN onTap(){} y funciones por el estilo
  ScrollController sc = ScrollController();

  // Creamos una varible que va a ser el índice del usuario (por donde va)
  int indexUser = 0;

  // Creamos un índice de hasta donde se puede mostrar las runas peligrosas
  int indexAlcanzado = 0;

  // Obtenemos la lista con el camino correcto
  List<int> runasPeligrosas = TemploData.generarCaminoCorrecto();

  @override
  void initState() {
    super.initState();
    sc.addListener(() => print("${sc.position.pixels}"));
  }

  @override
  void dispose() {
    sc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Juego"),
        actions: [
          Column(
            children: [
              IconButton(
                onPressed: () {
                  setState(() {
                    // Esta función hace que el scroll se mueva
                    sc.animateTo(
                      // Lo movemos hasta el comienzo
                      sc.position.minScrollExtent,
                      // Que dure 3 segundos la animación
                      duration: Duration(seconds: 3),
                      // Tipo de animación, en este caso deseleración
                      curve: Curves.decelerate,
                    );
                  });
                },
                icon: Icon(Icons.keyboard_arrow_up_outlined),
              ),
              IconButton(
                onPressed: () {
                  setState(() {
                    sc.animateTo(
                      // Se mueve hasta el final
                      sc.position.maxScrollExtent,
                      duration: Duration(seconds: 3),
                      curve: Curves.decelerate,
                    );
                  });
                },
                icon: Icon(Icons.keyboard_arrow_down_outlined),
              ),
            ],
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          controller: sc,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                spacing: 10,
                children: [
                  // Generamos 30 filas
                  for (int i = 0; i < 30; i++)
                    // Generamos 4 columnas
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      spacing: 10,
                      children: [
                        for (int j = 0; j < 4; j++)
                          GestureDetector(
                            onTap: () {
                              // Si el índice actual del usuario coincide con la fila i, se suma
                              if (indexUser == i) {
                                setState(() {
                                  // Sumamos el índice del usuario
                                  indexUser++;
                                });
                                /* Si el índice del usuario es mayor al índice alcanzado
                                 como máximo se puede sumar este último */
                                if (indexAlcanzado < indexUser) {
                                  setState(() {
                                    // Sumamos el índice record
                                    indexAlcanzado++;
                                  });
                                }
                                // Si se selecciona la runa ruta volvemos al principio
                                if (j == runasPeligrosas.elementAt(i)) {
                                  setState(() {
                                    // Reiniciamos el índice del usuario
                                    indexUser = 0;
                                  });
                                }
                              }
                            },
                            child: Container(
                              width: 100,
                              height: 50,
                              decoration: BoxDecoration(
                                color:
                                    /* Si es una runa rota y es menor al índice
                                     (para no mostrar los anteriores) alcanzado
                                     se podrá mostrar */
                                    runasPeligrosas.elementAt(i) == j &&
                                        /* Los índices i de las filas que sean menor
                                         al index record mostrará las runas rotas,
                                          porque el usuario habrá llegado hasta ahí*/
                                        indexAlcanzado > i
                                    ? Colors.white
                                    : Colors.brown.shade200,
                                border: BoxBorder.all(
                                  color: indexUser == i
                                      ? Colors.orange.shade700
                                      : Colors.black,
                                  width: 2,
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
