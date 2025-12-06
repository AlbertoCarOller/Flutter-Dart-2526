import 'package:deint/ejercicios_interfaz_usuario/gestor_inventario_tienda/model/producto_data.dart';
import 'package:flutter/material.dart';

class Nuevo extends StatefulWidget {
  const Nuevo({super.key});

  @override
  State<Nuevo> createState() => _NuevoState();
}

class _NuevoState extends State<Nuevo> {
  // Creamos la GlobalKey del formulario
  final _formKey = GlobalKey<FormState>();

  // Creamos el ScrollController
  final ScrollController sc = ScrollController();

  // Creamos los textController de cada campo
  final TextEditingController _textNombre = TextEditingController();
  final TextEditingController _textPrecio = TextEditingController();
  final TextEditingController _texUrlImagen = TextEditingController();

  // Creamos un mapa de los textController y su label
  Map<String, TextEditingController> get _mapTextControllers => {
    "Nombre": _textNombre,
    "Precio": _textPrecio,
    "Imagen": _texUrlImagen,
  };

  // Guardamos la categoría seleccionada
  Categoria? grupoValores;

  @override
  void initState() {
    super.initState();
    sc.addListener(() => print("${sc.position.pixels}"));
    _textNombre.addListener(() => print(_textNombre.text));
    _textPrecio.addListener(() => print(_textPrecio.text));
    _texUrlImagen.addListener(() => print(_texUrlImagen.text));
  }

  @override
  void dispose() {
    sc.dispose();
    _textNombre.dispose();
    _textPrecio.dispose();
    _texUrlImagen.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Nuevo")),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          controller: sc,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
            child: Column(
              spacing: 10,
              children: [
                for (MapEntry<String, TextEditingController> e
                    in _mapTextControllers.entries)
                  CampoPersonalizado(textController: e.value, label: e.key),
                RadioGroup<Categoria>(
                  groupValue: grupoValores,
                  onChanged: (value) {
                    setState(() {
                      grupoValores = value;
                    });
                  },
                  // No se puede utilizar un ListView si ya estamos dándole un scroll SingleChildScrollView
                  /*child: ListView.builder(
                    itemCount: Categoria.values.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(
                          Categoria.values.elementAt(index).name.toUpperCase(),
                        ),
                        trailing: Radio<Categoria>(
                          value: Categoria.values.elementAt(index),
                        ),
                      );
                    },
                  ),*/
                  child: Column(
                    children: [
                      for (Categoria c in Categoria.values)
                        ListTile(
                          title: Text(c.name.toUpperCase()),
                          trailing: Radio<Categoria>(value: c),
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

/// Esta función va a crear un TextFormField que dependiendo
/// del label lo creará para que acepte letras o números
class CampoPersonalizado extends StatelessWidget {
  final TextEditingController textController;
  final String label;

  const CampoPersonalizado({
    super.key,
    required this.textController,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: label == "Precio"
          ? TextInputType.number
          : TextInputType.text,
      controller: textController,
      decoration: InputDecoration(
        label: Text(label),
        border: OutlineInputBorder(),
        enabledBorder: UnderlineInputBorder()
      ),
      validator: (value) {
        if (label == "Precio") {
          try {
            int precio = int.parse(textController.text);
            if (precio > 0) {
              return "El precio debe ser mayor a 0";
            }
            return null;
          } on FormatException {
            return "No es número";
          }
        } else {
          if (textController.text.isEmpty) {
            return "El campo no es válido";
          }
          return null;
        }
      },
    );
  }
}
