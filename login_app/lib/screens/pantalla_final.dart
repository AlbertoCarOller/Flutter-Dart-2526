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
            Container(
              alignment: Alignment.center,
              child: Card(
                color: Colors.teal,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    UserData.currentUser != null
                        ? "Usuario actual: ${UserData.currentUser!.user!.email}"
                        : "Cargando usuario...",
                    style: TextStyle(fontSize: 24),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
