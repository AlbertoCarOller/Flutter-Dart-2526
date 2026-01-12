import 'package:firebase_auth/firebase_auth.dart';
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
          children: [
            Expanded(
              flex: 5,
              child: Container(
                alignment: Alignment.center,
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
                                Navigator.pushNamed(
                                  context,
                                  "/iniciar_sesion_screen",
                                ).then((value) => setState(() {}));
                              }
                            : null,
                        child: Text("Iniciar sesión"),
                      ),
                    ),
                    // Botón para crear cuenta
                    OutlinedButton(
                      onPressed: UserData.currentUser == null
                          ? () {
                        // pushNamed() devuelve un Future
                              Navigator.pushNamed(
                                context,
                                "/crear_cuenta_screen",
                                // Cuando vuelva se hace un setState()
                              ).then((value) => setState(() {}));
                            }
                          : null,
                      child: Text("Crear cuenta"),
                    ),
                  ],
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
                      onPressed: UserData.currentUser != null ? () {
                        // Cerramos la sesión
                        UserData.currentUser = null;
                        FirebaseAuth.instance.signOut();
                        setState(() {});
                      } : null,
                      child: Text("Cerrar sesión"),
                    ),
                    TextButton(
                      onPressed: UserData.currentUser != null
                          ? () {
                              // Borramos la cuenta
                              // userCredentialNew!.user!.delete(); -> Sirve para eliminar a un usuario
                              UserData.currentUser!.user!.delete();
                              UserData.currentUser = null;
                              setState(() {});
                            }
                          : null,
                      child: Text("Borrar cuenta"),
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
