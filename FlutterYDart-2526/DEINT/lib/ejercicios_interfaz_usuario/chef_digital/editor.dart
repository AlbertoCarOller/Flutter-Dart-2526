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

  // La lista de ingredientes temporales, para después añadirlo al objeto real
  final List<Ingrediente> ingredientes = [];
  final _textIngrediente = TextEditingController();
  final _textCantidadGramos = TextEditingController();

  /* Disfrazamos el mapa de get porque no se pueden utilizar variables aquí para
   declarar a otras, si lo ponemos como función si valdrá */
  Map<String, TextEditingController> get _mapaText => {
    "Calorías": _textCalorias,
    "Grasas": _textGrasas,
    "Proteinas": _textProteinas,
  };

  double sliderValue = 0;

  @override
  void initState() {
    super.initState();
    _textController.addListener(() => print(_textController.text));
    _textCalorias.addListener(() => print(_textCalorias.text));
    _textGrasas.addListener(() => print(_textGrasas.text));
    _textProteinas.addListener(() => print(_textProteinas.text));
    _textIngrediente.addListener(() => print(_textIngrediente.text));
    _textCantidadGramos.addListener(() => print(_textCantidadGramos.text));
  }

  @override
  void dispose() {
    _textController.dispose();
    _textGrasas.dispose();
    _textCalorias.dispose();
    _textProteinas.dispose();
    _textIngrediente.dispose();
    _textCantidadGramos.dispose();
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
        // Se colocan a la derecha del AppBar y realizan una acción o varias
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
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.only(
                  left: 10,
                  right: 10,
                  top: 40,
                  bottom: 30,
                ),
                // FormField, es mejor inferirle el tipo
                child: FormField<double>(
                  initialValue: sliderValue, // -> Para darle el valor incicial
                  builder: (field) {
                    return Column(
                      children: [
                        Text("Nivel de hambre"),
                        Slider(
                          label: sliderValue.round().toString(),
                          max: 100,
                          min: 0,
                          divisions: 10,
                          onChanged: (value) {
                            setState(() {
                              sliderValue = value;
                            });
                            /* .didChange(nuevoValor) -> Se usa para pasarle el
                             valor al FormField, este comprobará que funciona */
                            field.didChange(value);
                          },
                          value: sliderValue,
                        ),
                        // Validamos si el slider es correcto
                        if (field.hasError)
                          Text(
                            field.errorText!,
                            style: TextStyle(color: Colors.red),
                          ),
                      ],
                    );
                  },
                  // Validamos que no pueda ser menor a
                  validator: (value) {
                    if (value! <= 10) {
                      return "El valor debe ser mayor a 10";
                    }
                    return null;
                  },
                ),
              ),
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
                      child: TextFieldPersonalizado(
                        texto: e.key,
                        controller: e.value,
                      ),
                    ),
                  SizedBox(width: 1),
                ],
              ),
              SizedBox(height: 40),
              Column(
                children: [
                  Center(child: Text("Ingredientes")),
                  Row(
                    spacing: 20,
                    children: [
                      SizedBox(width: 1),
                      Expanded(
                        flex: 1,
                        child: TextFieldPersonalizado(
                          texto: "Cantidad en gramos",
                          controller: _textCantidadGramos,
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Se debe de introducir un nombre para el ingrediente";
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            label: Text("Nombre ingrediente"),
                          ),
                          controller: _textIngrediente,
                        ),
                      ),
                      IconButton(
                        onPressed: () => {
                          /* Si los campos son correctos, sobre todo los que corresponde al
                               ingrediente, se añade a la lista */
                          if (_formKey.currentState!.validate())
                            {
                              setState(() {
                                ingredientes.add(
                                  Ingrediente(
                                    _textIngrediente.text,
                                    _textCantidadGramos.text as double,
                                  ),
                                );
                              }),
                            },
                        },
                        icon: Icon(Icons.add),
                      ),
                      SizedBox(width: 1),
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

class TextFieldPersonalizado extends StatelessWidget {
  final String texto;
  final TextEditingController controller;

  const TextFieldPersonalizado({
    super.key,
    required this.texto,
    required this.controller,
  });

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
