import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:tienda_online/screens/inicio.dart';
import 'package:tienda_online/screens/tienda_screen.dart';

/// Este widget va a decidir que pantalla va a mostrar
/// dependiendo de si el usuario está logueado
class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    /* Hacemos un StreamBuilder el cual va a enterarse de los cambios de usuario,
     así podemos enterarnos si hay ya un usuario iniciado o no, FirebaseAuth.instance.authStateChanges() -> es el flujo
     de usuarios */
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        // En caso de que todavía no hayan llegado los datos, se muestra una espera
        if (snapshot.connectionState == ConnectionState.waiting) {
          // Usamos el efecto de cargando de huesos
         return Center(child: CircularProgressIndicator(),);
        }
        // En caso de que haya datos (exista un usuario logueado)
        if (snapshot.hasData || snapshot.data != null) {
          // Devolvemos la screen de la tienda
          return TiendaScreen();
        }
        // En caso de que no haya un usuario logueado
        return Inicio();
      },
    );
  }
}
