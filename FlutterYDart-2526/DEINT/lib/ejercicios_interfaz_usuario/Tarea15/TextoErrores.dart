import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(TextoErrores());
}

class TextoErrores extends StatelessWidget {
  const TextoErrores({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "TextoErrores",
      home: Texto(),
      theme: ThemeData(useMaterial3: true),
    );
  }
}

class Texto extends StatefulWidget {
  const Texto({super.key});

  @override
  State<Texto> createState() => _TextoState();
}

class _TextoState extends State<Texto> {
  var controller = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    controller.addListener(() => print(controller.text));
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
          padding: EdgeInsetsGeometry.all(200),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FormField<String>(
                  // Validamos que el campo no esté vacío
                  validator: (value) {
                    if (value!.isNotEmpty) {
                      return null;
                    } else {
                      return "No puede estar vacío";
                    }
                  },
                  // field representa el controlador de FormFieldState (FormField) avisa a su jefe form dependiendo del método
                  builder: (field) {
                    return TextField(
                      // Se necesita un decoration: InputDecoration() -> Para establecer el 'errorText'
                      decoration: InputDecoration(
                        label: Text("Introduce tu nombre"),
                        errorText: field.errorText,
                      ),
                      controller: controller, // controller del text pasa el valor a field
                      // Le damos el valor al controlador
                      onChanged: (value) => field.didChange(value),
                    );
                  },
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    _formKey.currentState?.validate();
                  },
                  child: Text("OK"),
                ),
              ],
            ),
          ),)
    );
  }
}
