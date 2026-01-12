import 'package:flutter/material.dart';
import 'package:login_app/data/user_data.dart';

class Screen1 extends StatefulWidget {
  const Screen1({super.key});

  @override
  State<Screen1> createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Iniciar sesión")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Creamos dos botones
            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              // Botón para iniciar sesión
              child: OutlinedButton(
                onPressed: UserData.currentUser == null
                    ? () {
                        Navigator.pushNamed(context, "/iniciar_sesion_screen");
                      }
                    : null,
                child: Text("Iniciar sesión"),
              ),
            ),
            // Botón para crear cuenta
            OutlinedButton(
              onPressed: UserData.currentUser == null
                  ? () {
                      Navigator.pushNamed(context, "/crear_cuenta_screen");
                    }
                  : null,
              child: Text("Crear cuenta"),
            ),
          ],
        ),
      ),
    );
  }
}
