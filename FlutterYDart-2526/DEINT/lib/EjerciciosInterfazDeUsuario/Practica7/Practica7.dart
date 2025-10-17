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
      body: Stack(
        children: [
          Container(color: Colors.blue.shade100),
          /* Obliga a la imagen a ser tan grande y alta como su padre, el stack,
           Expanded en cambio te permite en cuanto a ancho o largo, depende, ya
            que necesita un eje principal para expandirse*/
          Positioned.fill(
            // Opacity permite poner una opacidad a un hijo, en este caso una imagen
            child: Opacity(
              opacity: 0.07,
              child: Image(
                image: NetworkImage(
                  "https://blog.bonda.com/hubfs/Imported_Blog_Media/amistad.jpeg",
                ),
                // Evita que la imagen se deforme, ocupa lo que el elemento debe ocupar
                fit: BoxFit.cover,
              ),
            ),
          ),
          Column(
            children: [
              Expanded(
                flex: 3,
                child: Align(
                  alignment: Alignment.bottomCenter,
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
                    " mejor experiencia\nde su vida, adelante...",
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
                      child: Text(
                        "Iniciar sesión",
                        style: TextStyle(color: Colors.blue.shade600),
                      ),
                    ),
                    SizedBox(width: 20),
                    ElevatedButton(
                      style: ButtonStyle(),
                      onPressed: () {
                        print("Crear cuenta pulsado");
                      },
                      child: Text(
                        "Crear cuenta",
                        style: TextStyle(color: Colors.blue.shade600),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
