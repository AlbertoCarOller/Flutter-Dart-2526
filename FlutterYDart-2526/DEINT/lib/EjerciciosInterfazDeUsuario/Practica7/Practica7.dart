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
            que necesita un eje principal para expandirse, auqnue obligue a tener el tamaño
            del padre, la imagen puede tener lo que ella misma tenga con las restricciones del
            padre claro, y si no se le pone cover, no ocupa el espacio completo,ç
            simplemente se centra*/
          /* IMPORTANTE: esto le pasa la regla de ORO a la imagen (cosa que tiene container),
          * que tenga las dimesiones de su padre, STACK ,
          * los únicos widgets de los cuales STACK respeta el tamaño sin regla de oro son
          * combinando el widget con  Aling y Positioned*/
          Positioned.fill(
            // Opacity permite poner una opacidad a un hijo, en este caso una imagen
            child: Opacity(
              opacity: 0.07,
              child: Image(
                image: NetworkImage(
                  "https://blog.bonda.com/hubfs/Imported_Blog_Media/amistad.jpeg",
                ),
                /* Evita que la imagen se deforme, ocupa el máximo espacio del
                 padre (depende del mucho del padre que sea, CUIDADO) */
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
