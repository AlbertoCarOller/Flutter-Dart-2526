import 'package:flutter/material.dart';

/// Esta función es TextFormField personalizado
/// que en función del índice i mostrará una cosa
/// u otra
class TextPersonsalizado extends StatelessWidget {
  // El controller
  final TextEditingController textEditingController;

  // El índice por el que va el for
  final int i;

  const TextPersonsalizado({
    super.key,
    required this.textEditingController,
    required this.i,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textEditingController,
      decoration: InputDecoration(
        label: Text(i == 0 ? "Correo" : "Contraseña"),
        border: OutlineInputBorder(),
      ),
      validator: (value) {
        if (i == 0) {
          if (value!.isEmpty) {
            return "El correo no es válido";
          }
        } else {
          if (value!.length < 6) {
            return "La contraseña debe tener al menos 6 carcateres";
          }
        }
        return null;
      },
    );
  }
}
