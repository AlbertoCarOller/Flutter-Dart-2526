import 'package:flutter/material.dart';

void main() {
  runApp(LoginUsuario());
}

class LoginUsuario extends StatelessWidget {
  const LoginUsuario({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: "LoginUsuario", home: Login());
  }
}

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 3,
            child: Align(
              alignment: AlignmentGeometry.bottomCenter,
              // Para poner la foto de un avatar/usuario (es redondo)
              child: CircleAvatar(
                radius: 120,
                backgroundImage: NetworkImage(
                  "https://upload.wikimedia.org/wikipedia/"
                  "commons/thumb/1/12/User_icon_2.svg/250px-User_icon_2.svg.png",
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Center(
              child: Text(
                "Bienvenido",
                style: TextStyle(
                  fontSize: 50,
                  color: Colors.blue,
                  fontFamily: "San Francisco",
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
          ),
            Expanded(
              child: Card(
                elevation: 70,
                color: Colors.blue.shade300,
                child: Text(
                  "Bienvenido, espero que esté list@ para la"
                  " mejor experiencia\nde su vida, adelante",
                ),
              ),
            ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    print("Iniciar sesión pulsado");
                  },
                  child: Text("Sing in"),
                ),
                ElevatedButton(
                  onPressed: () {
                    print("Crear cuenta pulsado");
                  },
                  child: Text("Create account"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
