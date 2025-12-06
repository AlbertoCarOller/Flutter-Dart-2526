import 'package:flutter/material.dart';

class PantallaPrincipal extends StatefulWidget {
  const PantallaPrincipal({super.key});

  @override
  State<PantallaPrincipal> createState() => _PantallaPrincipalState();
}

class _PantallaPrincipalState extends State<PantallaPrincipal> {
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
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade500),
                    ),
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
                              width: (listasCaracteres
                                  .elementAt(i)
                                  .elementAt(j)!="ENVIAR") ?  70 : 142,
                              height: 90,
                              child: Card(
                                color: Colors.grey.shade500,
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
