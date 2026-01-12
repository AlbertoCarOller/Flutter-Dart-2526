import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login_app/data/user_data.dart';

class PantallaFinal extends StatefulWidget {
  const PantallaFinal({super.key});

  @override
  State<PantallaFinal> createState() => _PantallaFinalState();
}

class _PantallaFinalState extends State<PantallaFinal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Se muestra el usuario actual, puede que tarde un poco en cargar
            Expanded(
              flex: 6,
              child: Container(
                alignment: Alignment.center,
                child: Text(
                  UserData.currentUser != null
                      ? "Usuario actual: ${UserData.currentUser!.user!.email}"
                      : "Cargando usuario...",
                  style: TextStyle(fontSize: 24),
                ),
              ),
            ),
            // Botón para cerrar sesión
            Expanded(
              child: Container(
                alignment: Alignment.bottomRight,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {
                        // Cerramos la sesión
                        UserData.currentUser == null;
                        FirebaseAuth.instance.signOut();
                        Navigator.popUntil(context, (route) {
                          return route.settings.name == "/";
                        });
                      },
                      child: Text("Cerrar sesión"),
                    ),
                    TextButton(
                      onPressed: () {
                        // Borramos la cuenta
                        // userCredentialNew!.user!.delete(); -> Sirve para eliminar a un usuario
                        UserData.currentUser!.user!.delete();
                        UserData.currentUser == null;
                        Navigator.popUntil(context, (route) {
                          return route.settings.name == "/";
                        });
                      },
                      child: Text("Borra cuenta"),
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
