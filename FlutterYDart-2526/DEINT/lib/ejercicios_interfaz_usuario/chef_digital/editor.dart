import 'package:deint/ejercicios_interfaz_usuario/chef_digital/receta_data.dart';
import 'package:flutter/material.dart';

class Editor extends StatefulWidget {
  const Editor({super.key});

  @override
  State<Editor> createState() => _EditorState();
}

class _EditorState extends State<Editor> {
  // La key del formulario
  final _formKey = GlobalKey<FormState>();

  // El controlador del scroll
  final _scrollState = ScrollController();
  final _textController = TextEditingController();
  bool _esVegano = false;
  final _textCalorias = TextEditingController();
  final _textGrasas = TextEditingController();
  final _textProteinas = TextEditingController();

  /* Disfrazamos el mapa de get porque no se pueden utilizar variables aquí para
   declarar a otras, si lo ponemos como función si valdrá */
  Map<String, TextEditingController> get _mapaText => {
    "Calorías": _textCalorias,
    "Grasas": _textGrasas,
    "Proteinas": _textProteinas,
  };

  @override
  void initState() {
    super.initState();
    _textController.addListener(() => print(_textController.text));
    _textCalorias.addListener(() => print(_textCalorias.text));
    _textGrasas.addListener(() => print(_textGrasas.text));
    _textProteinas.addListener(() => print(_textProteinas.text));
    // La lista de ingredientes
    final List<Ingrediente> ingredientes = [];
  }

  @override
  void dispose() {
    _textController.dispose();
    _textGrasas.dispose();
    _textCalorias.dispose();
    _textProteinas.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pinkAccent.shade100,
      appBar: AppBar(
        title: Text(
          "Recetas",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.pink.shade400,
        // Se colocan a la derecha del AppBar y realizan una acción
        actions: [
          IconButton(
            onPressed: () =>
            // _scrollState.jumpTo() -> para ir a esa posición concreta
                _scrollState.jumpTo(_scrollState.position.minScrollExtent),
            icon: Icon(Icons.arrow_upward),
          ),
          IconButton(
            onPressed: () => {
              _scrollState.jumpTo(_scrollState.position.maxScrollExtent),
            },
            icon: Icon(Icons.arrow_downward),
          ),
        ],
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          controller: _scrollState,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.all(10),
                child: TextFormField(
                  decoration: InputDecoration(label: Text("Nombre del plato")),
                  controller: _textController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Debes de introducir un nombre del plato";
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(height: 10),
              SwitchListTile(
                title: Text("¿Es vegano?"),
                value: _esVegano,
                onChanged: (value) => setState(() {
                  _esVegano = value;
                }),
              ),
              SizedBox(height: 10),
              Row(
                spacing: 20,
                children: [
                  SizedBox(width: 1),
                  for (MapEntry<String, TextEditingController> e
                      in _mapaText.entries)
                    Expanded(
                      flex: 1,
                      child: TextFormField(
                        controller: e.value,
                        decoration: InputDecoration(label: Text(e.key)),
                        // Utilizamos el keyboard numérico con decimales
                        keyboardType: TextInputType.numberWithOptions(
                          decimal: true,
                        ),
                      ),
                    ),
                  SizedBox(width: 1),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TextField extends StatelessWidget {
  final String texto;
  final TextEditingController controller;

  const TextField({super.key, required this.texto, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        try {
          /* El parse es el método correcto para lanzar excepción al intentar
           transformar de un tipo a otro, el as es para cuando estás seguro
            de que es de ese tipo, no es para parsear, aún así lanza otro tipo de excepción */
          double.parse(value!);
          // on como el catch pero en Dart
        } on FormatException {
          return "No has insertado un número correcto";
        }
        return null;
      },
      controller: controller,
      decoration: InputDecoration(label: Text(texto)),
      // Utilizamos el keyboard numérico con decimales
      keyboardType: TextInputType.numberWithOptions(decimal: true),
    );
  }
}
