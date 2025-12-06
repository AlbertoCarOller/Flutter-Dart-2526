import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuintaPantallaFuncionalidad extends StatefulWidget {
  const QuintaPantallaFuncionalidad({super.key});

  @override
  State<QuintaPantallaFuncionalidad> createState() =>
      _QuintaPantallaFuncionalidadState();
}

class _QuintaPantallaFuncionalidadState
    extends State<QuintaPantallaFuncionalidad> {
  // Creamos un índice para saber en qué posición del GridView debemos de escribir
  int indexGridView = -1; // Empieza en -1 para no salirse del rango
  // Creamos una lista que contiene las letras que se van escribiendo
  List<String> letrasEscritas = [];
  // Creamos una MapEntry que guarde las coordenadas de donde se ha pulsado la tecla
  MapEntry<int, int> coordenadasKeyboard = MapEntry(-1, -1);

  List<String> caracteres_fila1 = [
    'q',
    'w',
    'e',
    'r',
    't',
    'y',
    'u',
    'i',
    'o',
    'p',
  ];
  List<String> caracteres_fila2 = [
    'a',
    's',
    'd',
    'f',
    'g',
    'h',
    'j',
    'k',
    'l',
    'ñ',
  ];
  List<String> caracteres_fila3 = [
    'ENVIAR',
    'z',
    'x',
    'c',
    'v',
    'b',
    'n',
    'm',
    'BACK',
  ];

  List<List<String>> get listasCaracteres => [
    caracteres_fila1,
    caracteres_fila2,
    caracteres_fila3,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "WORDLE (ES)",
          style: TextStyle(
            fontWeight: FontWeight.w900,
            fontSize: 48,
            letterSpacing: 3,
            leadingDistribution: TextLeadingDistribution.proportional,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Divider(),
          Expanded(
            flex: 2,
            child: SizedBox(
              height: 400,
              width: 620,
              // GridView de palabras
              child: GridView.builder(
                itemCount: 30,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 1.8,
                  mainAxisSpacing: 3,
                  crossAxisSpacing: 3,
                  crossAxisCount: 5,
                ),
                itemBuilder: (context, index) {
                  return Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade500),
                    ),
                    /* El índice de la casilla si es mayor o igual al número de palabras,
                    * quiere decir que el índice de la casilla no es válido para la extracción
                    * de la letra */
                    child: index >= letrasEscritas.length
                        ? null
                        : Text(
                            (letrasEscritas.elementAt(index)),
                            style: GoogleFonts.aboreto(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                  );
                },
              ),
            ),
          ),
          // El keyboard
          Expanded(
            flex: 1,
            child: Column(
              children: [
                Column(
                  children: [
                    for (int i = 0; i < listasCaracteres.length; i++)
                      Row(
                        spacing: 2,
                        children: [
                          for (
                            int j = 0;
                            j < listasCaracteres.elementAt(i).length;
                            j++
                          )
                            SizedBox(
                              width:
                                  (listasCaracteres.elementAt(i).elementAt(j) !=
                                      "ENVIAR")
                                  ? 67
                                  : 137,
                              height: 70,
                              child: GestureDetector(
                                /* Si el elemento (la tecla) es 'BACK' eliminar la letra del GridView
                                * y se comprueba antes que la lista de letras escritas no esté vacía
                                * porque si intenta acceder al índice de la misma para comprobar si
                                * está el 'Back' no puede dar error */
                                onTap:
                                    listasCaracteres
                                            .elementAt(i)
                                            .elementAt(j) ==
                                        "BACK"
                                    ? () {
                                        setState(() {
                                          // Guardamos las coordenas de la tecla que se ha pulsado
                                          coordenadasKeyboard = MapEntry(i, j);
                                          if (letrasEscritas.isNotEmpty &&
                                              indexGridView >= 0) {
                                            letrasEscritas.removeAt(
                                              indexGridView,
                                            );
                                            indexGridView--;
                                          }
                                        });
                                      }
                                    : () {
                                      // Guardamos las coordenas de la tecla que se ha pulsado
                                      coordenadasKeyboard = MapEntry(i, j);
                                        setState(() {
                                          indexGridView++;
                                          letrasEscritas.add(
                                            listasCaracteres
                                                .elementAt(i)
                                                .elementAt(j),
                                          );
                                        });
                                      },
                                child: Card(
                                  color: coordenadasKeyboard.key == i &&
                                      coordenadasKeyboard.value == j ? Colors.pinkAccent.shade400
                                  : Colors.grey.shade500,
                                  child: Center(
                                    child: (i == 2 && j == 8)
                                        ? Icon(Icons.backspace_outlined)
                                        : Text(
                                            listasCaracteres
                                                .elementAt(i)
                                                .elementAt(j),
                                            style: TextStyle(fontSize: 25),
                                          ),
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
        ],
      ),
    );
  }
}
