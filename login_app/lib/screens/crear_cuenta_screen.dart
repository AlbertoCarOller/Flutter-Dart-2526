import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../commons/components.dart';
import '../data/user_data.dart';

class CrearCuentaScreen extends StatefulWidget {
  const CrearCuentaScreen({super.key});

  @override
  State<CrearCuentaScreen> createState() => _CrearCuentaScreenState();
}

class _CrearCuentaScreenState extends State<CrearCuentaScreen> {
  // Creamos una key para el formulario
  final _formKey = GlobalKey<FormState>();

  // Creamos los TextController de los TextFormField
  TextEditingController correoController = TextEditingController();
  TextEditingController claveController = TextEditingController();

  // Creamos una lista donde almacenamos los textController
  List<TextEditingController> get lista => [correoController, claveController];

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Crear cuenta")),
      body: Form(
        key: _formKey,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
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
                // Al presionar intentamos crear cuenta
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    UserData.currentUser = await crearCuenta();
                    // En caso de que esté en el Stack y que sea la pantalla actual viajamos
                    if (context.mounted && UserData.currentUser != null) {
                      if (ModalRoute.of(context)!.isCurrent) {
                        Navigator.pushNamed(context, "/pantalla_final");
                      }
                    }
                  }
                },
                child: Text("Crear"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Creamos una función que va a devolver un UserCredential para crear un usuario
  /// con un correo y una contraseña
  Future<UserCredential?> crearCuenta() async {
    try {
      // Con la función createUserWithEmailAndPassword creamos un usuario con el correo y la contraseña concreta
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
            email: correoController.text,
            password: claveController.text,
          );
      return credential;
    } catch (e) {
      // Mostramos en caso de error
      if (mounted) {
        if (ModalRoute.of(context)!.isCurrent) {
          // Mostramos en caso de error
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("Error al crear cuenta: $e"),
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
