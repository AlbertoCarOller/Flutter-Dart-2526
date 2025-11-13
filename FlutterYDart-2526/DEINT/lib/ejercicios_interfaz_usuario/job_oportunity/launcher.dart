import 'package:flutter/material.dart';

class Launcher extends StatefulWidget {
  const Launcher({super.key});

  @override
  State<Launcher> createState() => _LauncherState();
}

class _LauncherState extends State<Launcher> {
  final _formKey = GlobalKey<FormState>(); // -> Clave del formulario
  var textControllerUsername =
      TextEditingController(); // -> Controlador del texto 'Username'
  var textControllerPassword =
      TextEditingController(); // -> Controlador del texto 'Password'

  // Creamos los bloques de inicialización y borrado de los text controller
  @override
  void initState() {
    super.initState();
    // Añadimos los listeners para que se impriman los text controller
    textControllerUsername.addListener(
      () => print(textControllerUsername.text),
    );
    textControllerPassword.addListener(
      () => print(textControllerPassword.text),
    );
  }

  @override
  void dispose() {
    // Eliminamos los text controller cuando ya no los usemos
    textControllerUsername.dispose();
    textControllerPassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
        title: Text("Sharing opportunities"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 2,
              // Container que contiene la imagen
              child: Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(20),
                child: Image.asset("assets/images/icon_job.png"),
              ),
            ),
            // Aquí vamos a poner los TextField que representa el username y el password
            Expanded(
              flex: 4,
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Aquí ponemos los campos (TextField) para el username y el password
                    CampoField(
                      textController: textControllerUsername,
                      errorText:
                          "La contraseña no puede ser menor a 8 caracteres",
                      labelText: "Username",
                      obscure: false,
                    ),
                    CampoField(
                      textController: textControllerPassword,
                      errorText:
                          "La contraseña no puede ser menor a 8 caracteres",
                      labelText: "Password",
                      obscure: true,
                    ),
                    // Botón para entrar
                    ElevatedButton(
                      onPressed: () {
                        // Si la validación es correcta
                        if (_formKey.currentState!.validate()) {
                          Navigator.pushNamed(context, "/central");
                        }
                      },
                      // style: ElevatedButton.styleFrom() -> Para darle estilo al botón
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.teal, // -> Color del botón
                        foregroundColor: Colors.white, // -> Color del texto
                        shape: RoundedRectangleBorder(
                          // -> Para darle forma al botón
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text("Entrar"),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Este widget representa un TextField en su completo, con un tamaño ajustado
/// gracias al SizeBox
class CampoField extends StatelessWidget {
  final TextEditingController
  textController; // -> Aquí guardamos el controlador del texto
  final String errorText; // -> Aquí guardamos el texto de error
  final String labelText; // -> Aquí guardamos el texto del label
  final bool obscure; // -> Aquí guardamos si queremos mostrar o no el texto

  const CampoField({
    super.key,
    required this.textController,
    required this.errorText,
    required this.labelText,
    required this.obscure,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // Creamos SizedBox para que los TextField no ocupen todo el ancho de la pantalla
      width: 400,
      child: TextFormField(
        obscureText: obscure,
        validator: (value) {
          if (value!.isEmpty) {
            return errorText; // -> En caso de que esté vacío
          }
          return null; // -> En caso de que no esté vacío
        },
        controller: textController, // -> Le asignamos el controlador
        decoration: InputDecoration(label: Text(labelText)),
      ),
    );
  }
}
