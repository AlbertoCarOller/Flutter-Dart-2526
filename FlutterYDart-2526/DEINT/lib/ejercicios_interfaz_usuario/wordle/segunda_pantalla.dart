import 'package:flutter/material.dart';

class SegundaPantalla extends StatefulWidget {
  const SegundaPantalla({super.key});

  @override
  State<SegundaPantalla> createState() => _SegundaPantallaState();
}

class _SegundaPantallaState extends State<SegundaPantalla> {
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
              height: 600,
              width: 700,
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
                      color: (index == 0 || index == 1 || index == 4)
                          ? Colors.grey.shade500
                          : (index == 2)
                          ? Colors.green
                          : (index == 3)
                          ? Colors.yellow.shade600
                          : null,
                      border: Border.all(color: Colors.grey.shade500),
                    ),
                    child: (index == 0)
                        ? Text(
                            "A",
                            style: TextStyle(
                              fontSize: 40,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        : (index == 1)
                        ? Text(
                            "I",
                            style: TextStyle(
                              fontSize: 40,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        : (index == 2)
                        ? Text(
                            "R",
                            style: TextStyle(
                              fontSize: 40,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        : (index == 3)
                        ? Text(
                            "E",
                            style: TextStyle(
                              fontSize: 40,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        : (index == 4)
                        ? Text(
                            "S",
                            style: TextStyle(
                              fontSize: 40,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        : null,
                  );
                },
              ),
            ),
          ),
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
                                  ? 70
                                  : 142,
                              height: 90,
                              child: Card(
                                color: (i == 0 && j == 2)
                                    ? Colors.yellow.shade800
                                    : (i == 0 && j == 3)
                                    ? Colors.green.shade800
                                    : ((i == 0 && j == 7) ||
                                          (i == 1 && j == 0) ||
                                          (i == 1 && j == 1))
                                    ? Colors.grey.shade500
                                    : Colors.grey.shade300,
                                child: Center(
                                  child: (i == 2 && j == 8)
                                      ? Icon(Icons.backspace_outlined)
                                      : Text(
                                          listasCaracteres
                                              .elementAt(i)
                                              .elementAt(j),
                                          style: TextStyle(
                                            fontSize: 25,
                                            color:
                                                ((i == 0 && j == 2) ||
                                                    (i == 0 && j == 3) ||
                                                    ((i == 0 && j == 7) ||
                                                        (i == 1 && j == 0) ||
                                                        (i == 1 && j == 1)))
                                                ? Colors.white
                                                : Colors.black,
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
