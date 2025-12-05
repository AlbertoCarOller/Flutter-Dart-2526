/*
[x] TODO: Añadir los elementos para desarrollar la interfaz sin estilos.
[x] TODO: Añadir estilos para que la interfaz sea identica a la reflejada en la
    documentación.
[x] TODO: Estilo de los campos de entrada cambian cuando tienen el foco.
[x] TODO: Añadir para el primer campo de entrada la validación. Su valor debe tener entre
    3 y 8 caracteres. El teclado a mostrar es acorde con los datos de entrada.
[x] TODO: Añadir para el segundo campo de entrada la validación. Su valor debe tener entre
    3 y 8 caracteres. El teclado a mostrar es acorde con los datos de entrada.
[x] TODO: Añadir para el tercer campo de entrada la validación. La edad introducida
    debe estar comprendida entre 18 y 100 ambos inclusive. 
    El teclado a mostrar es acorde con los datos de entrada.
[x] TODO: Añadir funcionalidad al botón.
[x] TODO: Mi código es legible y está bien comentando.
 */

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // Creamos la key del formulario
  final _formKey = GlobalKey<FormState>();

  // Creamos los controladores de los TextFormField
  final _textNombre = TextEditingController();
  final _textApellido = TextEditingController();
  final _textEdad = TextEditingController();

  // Creamos un mapa con el label y controlador de cada TextFormField
  Map<String, TextEditingController> get mapa => {
    "First Name": _textNombre,
    "Last Name": _textApellido,
    "Age": _textEdad,
  };

  @override
  void initState() {
    super.initState();
    _textNombre.addListener(() => print(_textNombre.text));
    _textApellido.addListener(() => print(_textApellido.text));
    _textEdad.addListener(() => print(_textEdad.text));
  }

  @override
  void dispose() {
    _textNombre.dispose();
    _textApellido.dispose();
    _textEdad.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Columna principal que ocupa el espacio completo
      body: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(image: AssetImage("/images/logo.png"), width: 250),
            Container(
              padding: EdgeInsetsGeometry.only(
                left: 50,
                right: 50,
                top: 145,
                bottom: 20,
              ),
              child: Column(
                spacing: 10,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Recorremos el mapa con los TextFormField
                  for (MapEntry<String, TextEditingController> e
                      in mapa.entries)
                    TextPersonalizado(
                      textEditingController: e.value,
                      label: e.key,
                    ),
                ],
              ),
            ),
            // Aquí va el botón
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                fixedSize: Size(95, 50),
                backgroundColor: Color.fromRGBO(239, 56, 103, 1.0),
                foregroundColor: Colors.black,
                shape: RoundedRectangleBorder(),
              ),
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  Navigator.pushNamed(context, "/terminos");
                }
              },
              child: Row(
                spacing: 3,
                children: [
                  Icon(Icons.gamepad, color: Colors.blue),
                  Text("Go!!", style: TextStyle(fontWeight: FontWeight.bold),),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Esta función va a crear los 3 TextFormField necesarios
/// para la edad, el nombre y  apellido
class TextPersonalizado extends StatelessWidget {
  final TextEditingController textEditingController;
  final String label;

  const TextPersonalizado({
    super.key,
    required this.textEditingController,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: label == "Age" ? TextInputType.number : TextInputType.text,
      controller: textEditingController,
      decoration: InputDecoration(
        label: Text(label),
        border: UnderlineInputBorder(),
        enabledBorder: OutlineInputBorder(),
      ),
      /* Hacemos las diferentes comprobaciones dependiendo de si es la edad
       o alguno de los otros dos campos */
      validator: (value) {
        if (label != "Age") {
          if (value!.length < 3 || value.length > 8) {
            return "El campo debe estar entre 3 y 8 caracteres";
          }
        } else {
          try {
            int edad = int.parse(value!);
            if (edad < 18 || edad > 100) {
              return "No estás en los rango válidos de edad";
            }
          } on FormatException {
            return "La edad no es válida";
          }
        }
        return null;
      },
    );
  }
}
