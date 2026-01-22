import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CrearEncuesta extends StatefulWidget {
  const CrearEncuesta({super.key});

  @override
  State<CrearEncuesta> createState() => _CrearEncuestaState();
}

class _CrearEncuestaState extends State<CrearEncuesta> {
  // Creamos el controller del Text para el nombre del documento
  final _nombreController = TextEditingController();

  // Creamos el controller del Text para los campos del documento
  final _campoController = TextEditingController();

  // Creamos una lista que contiene todos los campos que se han ido añadiendo
  List<String> campos = [];

  // Creamos las keys para validar los campos de forma individual a los TextFormField
  final _nombreKey = GlobalKey<FormFieldState>();
  final _campoKey = GlobalKey<FormFieldState>();

  @override
  void initState() {
    super.initState();
    _nombreController.addListener(() => print(_nombreController.text));
    _campoController.addListener(() => print(_campoController.text));
  }

  @override
  void dispose() {
    _nombreController.dispose();
    _campoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Rescatamos de los argumentos el Collection reference
    CollectionReference collectionReference =
        ModalRoute.of(context)!.settings.arguments as CollectionReference;
    return Scaffold(
      appBar: AppBar(
        title: Text("Crear encuesta"),
        centerTitle: true,
        backgroundColor: Colors.orange.shade300,
      ),
      body: Column(
        children: [
          for (int i = 0; i < 2; i++)
            // El TextFormField personalizado
            Padding(
              padding: const EdgeInsets.only(bottom: 10, right: 10, left: 10),
              child: TextPersonalizado(
                i: i,
                controller: i == 0 ? _nombreController : _campoController,
                keyText: i == 0 ? _nombreKey : _campoKey,
              ),
            ),
          // En la row creamos los botones para guardar campos o bien para guardar la encuesta
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              // Con este botón guardamos el campo
              OutlinedButton(
                onPressed: () {
                  // En caso de que el campo sea válido se añade
                  if (_campoKey.currentState!.validate()) {
                    campos.add(_campoController.text);
                    _campoController.clear();
                  }
                },
                child: Text("Guardar campo"),
              ),
              // Con este botón se crea la encuesta
              OutlinedButton(
                onPressed: () {
                  // Validamos el campo del nombre y que al menos tenga un campo
                  if (_nombreKey.currentState!.validate() &&
                      campos.isNotEmpty) {
                    // Creamos la encuesta
                    crearEncuesta(collectionReference);
                    // Navegamos hacia atrás
                    Navigator.popUntil(
                      context,
                      (route) => route.settings.name == "/",
                    );
                  }
                },
                child: Text("Guardar encuesta"),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Future<void> crearEncuesta(CollectionReference collection) async {
    /* Con set() creamos nosotros el id del documento, con add() el id es el
       que decida firebase */
    await collection
        // Le ponemos el id al document que creamos
        .doc(_nombreController.text)
        // Gracias a la función de Map fromEntries() guardamos los campos
        .set(Map.fromEntries(campos.map((e) => MapEntry(e, 0))));
  }
}

/// Este widget es un TextFormField que dependiendo de
/// la i (índice del for) mostrará una cosa u otra en el label,
/// también le pasamos el controller concreto
class TextPersonalizado extends StatelessWidget {
  final int i;
  final TextEditingController controller;
  final Key keyText;

  const TextPersonalizado({
    super.key,
    required this.i,
    required this.controller,
    required this.keyText,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: keyText,
      controller: controller,
      decoration: InputDecoration(
        icon: i == 0 ? Icon(Icons.abc) : Icon(Icons.account_tree_outlined),
        border: InputBorder.none,
        label: Text(i == 0 ? "Nombre encuesta" : "Nombre campo"),
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return "El campo es inválido";
        }
        return null;
      },
    );
  }
}
