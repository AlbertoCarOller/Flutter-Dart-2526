import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login_app/UserData.dart';

class IniciarSesionScreen extends StatefulWidget {
  const IniciarSesionScreen({super.key});

  @override
  State<IniciarSesionScreen> createState() => _IniciarSesionScreenState();
}

class _IniciarSesionScreenState extends State<IniciarSesionScreen> {
  // Creamos la key del formulario
  final _formKey = GlobalKey<FormState>();

  // Creamos los TextController de los TextFormField
  TextEditingController correoController = TextEditingController();
  TextEditingController claveController = TextEditingController();

  // Creamos una lista donde almacenamos los textController
  List<TextEditingController> get lista => [correoController, claveController];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Inicio de sesión")),
      body: Form(
        key: _formKey,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Recorremos la lista de los controller
              for (int i = 0; i < lista.length; i++)
                Padding(
                  padding: const EdgeInsets.only(
                    right: 30,
                    left: 30,
                    bottom: 8,
                  ),
                  child: TextPersonsalizado(
                    textEditingController: lista.elementAt(i),
                    i: i,
                  ),
                ),
              TextButton(
                // Al presionar intentamos iniciar sesión
                onPressed: () async {
                  UserData.currentUser = await accederCuenta(
                    correoController.text,
                    claveController.text,
                  );
                  setState(() {});
                },
                child: Text("Iniciar"),
              ),
              // Mostramos el correo en caso de que se haya iniciado sesión
              Text(UserData.currentUser != null ? UserData.currentUser!.user!.email! : "")
            ],
          ),
        ),
      ),
    );
  }
}

/// Esta función es TextFormField personalizado
/// que en función del índice i mostrará una cosa
/// u otra
class TextPersonsalizado extends StatelessWidget {
  // El controller
  final TextEditingController textEditingController;

  // El índice por el que va el for
  final int i;

  const TextPersonsalizado({
    super.key,
    required this.textEditingController,
    required this.i,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textEditingController,
      decoration: InputDecoration(
        label: Text(i == 0 ? "Correo" : "Contraseña"),
        border: OutlineInputBorder(),
      ),
      validator: (value) {
        if (i == 0) {
          if (value!.isEmpty) {
            return "El correo no es válido";
          }
        } else {
          if (value!.length < 8) {
            return "La contraseña debe tener al menos 6 carcateres";
          }
        }
        return null;
      },
    );
  }
}

/// Esta función va a iniciar sesión con un correo y contraseña
/// concretos, devuelve un UserCredential, que es un objeto que nos
/// permite identificar de forma única y segura a los usuarios
Future<UserCredential?> accederCuenta(String correo, String clave) async {
  try {
    // Con la función signInWithEmailAndPassword() intentamos acceder a un usuario, mediante correo y contraseña
    final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: correo,
      password: clave,
    );
    // El objeto que se devuelve son las credenciales del usuario
    return credential;
  } catch (e) {
    print("Error al iniciar sesión");
    return null;
  }
}
