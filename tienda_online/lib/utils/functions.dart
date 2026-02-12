import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

/// Esta función va a crear una cuenta en firebase, se
/// registrará con el correo y contraseña pasada creadas
/// por el usuario
Future<UserCredential?> registrarse(
  String email,
  String password,
  BuildContext context,
) async {
  // Envolvemos en try-catch para atrapar cualquier excepción
  try {
    // Creamos el usuario con el email y contraseña
    return await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    // Devolvemos el 'UserCredential' en caso de que haya salido bien
  } on FirebaseAuthException catch (e) {
    // Comprobamos con los códigos de error cuales son para personalizarlos
    // Comprobamos que siga montado el contexto y que sea la pantalla actual, para mostrar el SnackBar
    if (context.mounted && ModalRoute.of(context)!.isCurrent) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            "Error: ${e.code == "email-already-in-use"
                ? "El email está en uso"
                : e.code == "weak-password"
                ? "Contraseá débil"
                : e.code == "invalid-email"
                ? "Correo inválido"
                : "Error inesperado"}",
            style: TextStyle(color: Colors.purple),
          ),
          duration: Duration(seconds: 2),
          backgroundColor: Colors.white,
        ),
      );
    }
    return null;
  }
}

/// Esta función va a iniciar sesión con una cuenta ya registrada en
/// Firebase
Future<UserCredential?> iniciarSesion(
  String email,
  String password,
  BuildContext context,
) async {
  try {
    return await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  } on FirebaseAuthException catch (e) {
    // Comprobamos que siga montado el contexto y que sea la pantalla actual, para mostrar el SnackBar
    if (context.mounted && ModalRoute.of(context)!.isCurrent) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            "Error: ${e.code == "invalid-credential"
                ? "El correo o la contraseña son incorrectos"
                : e.code == "user-not-found"
                ? "Usuario no encontrado"
                : e.code == "wrong-password"
                ? "Contraseña incorrecta"
                : "Error inesperado"}",
            style: TextStyle(color: Colors.purple),
          ),
          duration: Duration(seconds: 2),
          backgroundColor: Colors.white,
        ),
      );
    }
    return null;
  }
}
