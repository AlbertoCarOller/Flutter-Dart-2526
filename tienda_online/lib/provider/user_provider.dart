import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  // Almacenamos las credenciales del usuario
  static UserCredential? userCredential;

  /// Esta función va a crear una cuenta en firebase, se
  /// registrará con el correo y contraseña pasada creadas
  /// por el usuario
  static Future<void> registrarse(String email, String password) async {
    // Envolvemos en try-catch para atrapar cualquier excepción
    try {
      // Creamos el usuario con el email y contraseña
      userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      // Devolvemos el 'UserCredential' en caso de que haya salido bien
    } catch (e) {
      print("Error: $e");
    }
  }

  /// Esta función va a iniciar sesión con una cuenta ya registrada en
  /// Firebase
  static Future<void> iniciarSesion(
    String email,
    String password,
    BuildContext context,
  ) async {
    try {
      userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } catch (e) {
      print("Error: $e");
      // Comprobamos que siga montado el contexto y que sea la pantalla actual, para mostrar el SnackBar
      if (context.mounted && ModalRoute.of(context)!.isCurrent) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              "No se ha podido iniciar sesión",
              style: TextStyle(color: Colors.purple),
            ),
            duration: Duration(seconds: 2),
            backgroundColor: Colors.white,
          ),
        );
      }
    }
  }
}
