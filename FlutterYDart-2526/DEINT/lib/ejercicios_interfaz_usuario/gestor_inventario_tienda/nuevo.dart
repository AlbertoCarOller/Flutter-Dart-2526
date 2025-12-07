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

  // Creamos un map con las etiquetas disponibles y si está seleccionada o no
  Map<String, bool> etiquetas = {
    "Nuevo": false,
    "Fragil": false,
    "Importado": false,
  };

  // Creamos una variable que va a almacenar el stock del producto
  int stock = 0;

  // Creamos una varible para saber si está en oferta o no el producto
  bool enOferta = false;

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
    // Nos traemos de la función para pasarla al navegar hacia atrás y actualizar la pantalla
    Function() function =
        ModalRoute.of(context)!.settings.arguments as Function();
    return Scaffold(
      appBar: AppBar(
        title: Text("Nuevo"),
        actions: [
          // Para cambiar si el producto está en oferta o no
          Row(
            children: [
              Text("En oferta"),
              Switch(
                activeThumbColor: Colors.orange.shade900,
                activeThumbImage: AssetImage("/images/disco.png"),
                inactiveThumbImage: AssetImage("/images/disco.png"),
                value: enOferta,
                onChanged: (value) {
                  setState(() {
                    enOferta = value;
                  });
                },
              ),
            ],
          )
        ],
      ),
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
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Text("Seleccione la categoría"),
                ),
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
                          trailing: Radio<Categoria>(
                            value: c,
                            activeColor: Colors.orange.shade700,
                          ),
                        ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Text("Seleccione las etiquetas"),
                ),
                for (MapEntry<String, bool> et in etiquetas.entries)
                  ListTile(
                    title: Text(et.key),
                    trailing: Checkbox(
                      activeColor: Colors.orange.shade700,
                      value: et.value,
                      onChanged: (value) {
                        setState(() {
                          etiquetas[et.key] = value!;
                        });
                      },
                    ),
                  ),
                // Creamos la sección del slider para seleccionar el stock del producto
                Padding(
                  padding: EdgeInsetsGeometry.only(top: 20),
                  child: Column(
                    children: [
                      Text("Seleccione el stock del producto"),
                      Slider(
                        activeColor: Colors.orange.shade700,
                        label: "${stock.toInt()}",
                        max: 100,
                        min: 0,
                        divisions: 100,
                        value: stock.toDouble(),
                        onChanged: (value) {
                          setState(() {
                            stock = value.toInt();
                          });
                        },
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsGeometry.only(top: 20),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.orange.shade700,
                      backgroundColor: Colors.grey.shade200,
                    ),
                    onPressed:
                        grupoValores != null &&
                            etiquetas.entries
                                .where((e) => e.value == true)
                                .isNotEmpty
                        ? () {
                            // Comrprobamos que los campos sean válidos
                            if (_formKey.currentState!.validate()) {
                              // Creamos y guardamos el nuevo producto
                              InventarioDataBase.addProducto(
                                Producto(
                                  _textNombre.text,
                                  double.parse(_textPrecio.text),
                                  stock,
                                  grupoValores!,
                                  enOferta,
                                  etiquetas.entries
                                      .where((e) => e.value == true)
                                      .map((e) => e.key)
                                      .toList(),
                                  _texUrlImagen.text,
                                ),
                              );
                              // Viajamos a la pantalla anterior
                              Navigator.pop(context, function());
                            }
                          }
                        : null,
                    child: Text("Guardar"),
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
    return Card(
      color: Colors.grey.shade300,
      child: TextFormField(
        keyboardType: label == "Precio"
            ? TextInputType.number
            : TextInputType.text,
        controller: textController,
        decoration: InputDecoration(
          icon: label == "Nombre"
              ? Icon(Icons.drive_file_rename_outline)
              : label == "Precio"
              ? Icon(Icons.euro)
              : Icon(Icons.image),
          // Le damos color de fondo
          /*filled: true,
          fillColor: Colors.grey.shade200,*/
          label: Text(label),
          // Quitamos los bordes
          border: InputBorder.none,
          /*border: OutlineInputBorder(
            // Le damos un borde más redondeado
            //borderRadius: BorderRadius.all(Radius.circular(5)),
          ),*/
          //enabledBorder: UnderlineInputBorder(),
        ),
        validator: (value) {
          if (label == "Precio") {
            try {
              double precio = double.parse(textController.text);
              if (precio < 0) {
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
      ),
    );
  }
}
