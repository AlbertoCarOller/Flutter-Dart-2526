import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    /* Hacemos un StreamBuilder el cual va a enterarse de los cambios de usuario,
     así podemos enterarnos si hay ya un usuario iniciado o no, FirebaseAuth.instance.authStateChanges() -> es el flujo
     de usuarios */
    return StreamBuilder<User?>(
      // TODO: por hacer
        stream: FirebaseAuth.instance.authStateChanges(), builder: (context, snapshot) {
        },);
  }
}
