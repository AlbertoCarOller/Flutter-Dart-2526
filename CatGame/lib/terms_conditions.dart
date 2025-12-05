/*
[x] TODO: Añadir elementos y estilos de la cabecera.
[x] TODO: Añadir elementos y estilos para que la interfaz sea identica a la reflejada en la
    documentación.
[] TODO: Incluir flutter_lorem (paquete) para generar el texto. 10 parrafos y 1000 palabras. 
[x] TODO: El botón aparece cuando el usuario lee el contenido completo del texto.
[x] TOOD: Funcionalidad del slider.
[x] TODO: Mi código es legible y está bien comentando.
 */

import 'package:flutter/material.dart';
import 'package:flutter_application_cat_game/data/data_avatar.dart';

class TermsConditions extends StatefulWidget {
  const TermsConditions({super.key});

  @override
  State<TermsConditions> createState() => _TermsConditionsState();
}

class _TermsConditionsState extends State<TermsConditions> {
  // Creamos la key del formulario
  final _formKey = GlobalKey<FormState>();

  // Creamos el controlador del scroll, también tiene bloques init y dispose
  ScrollController sc = ScrollController();

  // Esta variable nos indicará si ha leído o no
  bool leido = false;

  @override
  void initState() {
    super.initState();
    sc.addListener(
      () => setState(() {
        leido = sc.position.pixels == sc.position.maxScrollExtent;
      }),
    );
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
        title: Text("Términos y condiciones"),
        actions: leido
            ? [
                IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, "/select");
                  },
                  icon: Icon(Icons.radar),
                  color: Color.fromRGBO(239, 56, 103, 1.0),
                ),
              ]
            : null,
      ),
      body: Form(
        key: _formKey,
        child: Center(
          // Columna principal
          child: Container(
            margin: EdgeInsetsGeometry.symmetric(horizontal: 20),
            child: Column(
              children: [
                Expanded(
                  flex: 6,
                  child: SingleChildScrollView(
                    controller: sc,
                    child: Column(
                      children: [
                        for (int i = 0; i < 10; i++)
                          Text(
                            "Lorem ipsum dolor sit amet, consectetur adipiscing elit."
                            " Pellentesque eget risus vitae mauris mollis semper."
                            " Aenean bibendum vehicula lacus nec tempor. Aenean"
                            " sollicitudin quis urna a aliquam. Aliquam lacinia"
                            " congue justo, id rhoncus orci varius sed. Aenean"
                            " eleifend aliquam bibendum. Integer scelerisque "
                            "tincidunt augue, a egestas lacus. Proin quis leo a"
                            " augue faucibus ultricies in nec velit. Cras imperdiet"
                            " maximus elit nec fermentum. Donec tristique urna quis"
                            " ipsum vulputate efficitur. Donec sed risus gravida,"
                            " iaculis metus vel, ullamcorper dui. Quisque feugiat"
                            " leo eros, sit amet tincidunt libero convallis vitae."
                            " Phasellus non condimentum ante. Class aptent taciti"
                            " sociosqu ad litora torquent per conubia nostra,"
                            " per inceptos himenaeos. \n",
                          ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Row(
                    spacing: 8,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(Icons.people),
                      Expanded(
                        child: Slider(
                          activeColor: Color.fromRGBO(14, 83, 98, 1.0),
                          inactiveColor: Color.fromRGBO(176, 32, 77, 1.0),
                          label: "${DataAvatar.numOponentes}",
                          value: DataAvatar.numOponentes.toDouble(),
                          onChanged: (value) {
                            setState(() {
                              DataAvatar.numOponentes = value.round();
                            });
                          },
                          max: DataAvatar.rawData.length.toDouble() - 1,
                          min: 1,
                          divisions: DataAvatar.rawData.length - 1,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
