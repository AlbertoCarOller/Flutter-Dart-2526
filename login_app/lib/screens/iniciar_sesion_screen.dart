import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login_app/data/user_data.dart';
import '../commons/components.dart';

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

  @override
  void initState() {
    super.initState();
    correoController.addListener(() => print(correoController.text));
    claveController.addListener(() => print(claveController.text));
  }

  @override
  void dispose() {
    correoController.dispose();
    claveController.dispose();
    super.dispose();
  }

  // Creamos una lista donde almacenamos los textController
  List<TextEditingController> get lista => [correoController, claveController];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Iniciar sesión")),
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
                  if (_formKey.currentState!.validate()) {
                    UserData.currentUser = await accederCuenta();
                    // En caso de que esté en el Stack y que sea la pantalla actual viajamos
                    if (context.mounted && UserData.currentUser != null) {
                      if (ModalRoute.of(context)!.isCurrent) {
                        Navigator.pushNamed(context, "/pantalla_final");
                      }
                    }
                  }
                },
                child: Text("Iniciar"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Esta función va a iniciar sesión con un correo y contraseña
  /// concretos, devuelve un UserCredential, que es un objeto que nos
  /// permite identificar de forma única y segura a los usuarios
  Future<UserCredential?> accederCuenta() async {
    try {
      // Con la función signInWithEmailAndPassword() intentamos acceder a un usuario, mediante correo y contraseña
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: correoController.text,
        password: claveController.text,
      );
      // El objeto que se devuelve son las credenciales del usuario
      return credential;
    } catch (e) {
      if (mounted) {
        if (ModalRoute.of(context)!.isCurrent) {
          // Mostramos en caso de error
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("Error al iniciar sesión: $e"),
              duration: Duration(seconds: 2),
              backgroundColor: Colors.redAccent.shade200,
            ),
          );
        }
      }
      return null;
    }
  }
}
