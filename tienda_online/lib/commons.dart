import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

/// Este widget tiene su propio estado es un TextFormField personalizado
/// dependiendo de la situación, evitando así la repetición de código
class TextFieldPersonalizado extends StatefulWidget {
  final TextEditingController controller;
  final String label;
  final String tipo;

  // Este solo sirve para comporbar que en la replica del password asegurarnos que los passwords son los mismos
  final bool igualReplica;

  const TextFieldPersonalizado({
    super.key,
    required this.controller,
    required this.label,
    required this.tipo,
    required this.igualReplica,
  });

  @override
  State<TextFieldPersonalizado> createState() => _TextFieldPersonalizadoState();
}

class _TextFieldPersonalizadoState extends State<TextFieldPersonalizado> {
  // Para hacer visible o no el contenido del TextFormField
  bool visible = false;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      // Si es visible o no
      obscureText: visible,
      decoration: InputDecoration(
        icon: widget.tipo.contains("password") == true
            ? IconButton(
                // Al pulsar cambiamos el estado para que sea visible la contraseña
                onPressed: () {
                  setState(() {
                    visible = !visible;
                  });
                },
                icon: visible == true
                    ? Icon(Icons.visibility)
                    : Icon(Icons.visibility_off),
              )
            : null,
        filled: true,
        fillColor: Colors.white,
        hint: Text(widget.label),
        border: OutlineInputBorder(),
      ),
      validator: (value) {
        String? mensajeTemporal = "";
        // Validamos según el tipo con un 'switch'
        switch (widget.tipo) {
          // En caso de que haya que validar el formato de un email
          case "email_validator":
            mensajeTemporal =
                EmailValidator.validate(widget.controller.text) == false
                ? "El email tiene un formato incorrecto"
                : null;
          // En caso de que haya que comprobar el formato de la contraseña
          case "password_validator":
            mensajeTemporal = value!.length < 8
                ? "La contraseña debe tener al menos 8 carateres"
                : null;
          // En caso de que sea la réplica del password
          case "replica_password":
            mensajeTemporal = widget.igualReplica == false
                ? "La contraseña debe ser la misma"
                : null;
          // En caso de que el tipo sea caulquier otra cosa, solo se valida que no esté vacío
          default:
            mensajeTemporal = value!.isEmpty == true
                ? "El campo no puede estar vacío"
                : null;
        }
        // Retornamos el mensaje a validar
        return mensajeTemporal;
      },
    );
  }
}
