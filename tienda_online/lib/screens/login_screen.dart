import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tienda_online/provider/CarritoProvider.dart';

import '../utils/functions.dart';
import '../utils/commons.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // Creamos los controllers
  final _controllerEmail = TextEditingController();
  final _controllerPassword = TextEditingController();

  // Creamos una variable bandera para ver que podamos pasar de pantalla
  bool usuarioIniciado = false;

  @override
  void initState() {
    super.initState();
    _controllerEmail.text = "test@gmail.com";
    _controllerPassword.text = "12345678";
    _controllerEmail.addListener(() => print(_controllerEmail.text));
    _controllerPassword.addListener(() => print(_controllerPassword.text));
  }

  @override
  void dispose() {
    _controllerEmail.dispose();
    _controllerPassword.dispose();
    super.dispose();
  }

  // Creamos la key del formulario
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.white, Colors.purple.shade300],
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/images/logoKivoCompleto.png", scale: 2),
              Padding(
                padding: EdgeInsetsGeometry.only(bottom: 6),
                child: Text(
                  "Inicia sesión",
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
              ),
              // Un for que va a crear los TextFormField
              for (int i = 0; i < 2; i++)
                Padding(
                  padding: EdgeInsetsGeometry.only(bottom: 12),
                  child: SizedBox(
                    width: 400,
                    child: TextFieldPersonalizado(
                      controller: i == 0
                          ? _controllerEmail
                          : _controllerPassword,
                      label: i == 0
                          ? "Introduce el email"
                          : "Introduce la contraseña",
                      tipo: i == 0 ? "email_validator" : "password_validator",
                      controllerPassword: _controllerPassword,
                    ),
                  ),
                ),
              Padding(
                padding: EdgeInsetsGeometry.only(top: 8, bottom: 4),
                child: SizedBox(
                  width: 150,
                  child: TextButton(
                    onPressed: () async {
                      // Comprobamos que estén bien los campos
                      if (_formKey.currentState!.validate()) {
                        usuarioIniciado = await iniciarSesion(
                          _controllerEmail.text,
                          _controllerPassword.text,
                          // Le pasamos el context para poder mostrar el SnackBar
                          this.context,
                        ).then((value) => value != null);
                      }
                      CollectionReference<Map<String, dynamic>> collection =
                          FirebaseFirestore.instance.collection("informacion");
                      // Cargamos los datos del usuario (carrito)
                      //await context.read<CarritoProvider>()
                      // Comprobamos que esté en el stack
                      if (mounted) {
                        // Comprobamos que sea la pantalla actual
                        if (ModalRoute.of(this.context)!.isCurrent) {
                          // En caso de que el usuario sea distinto de null, viajamos a la screen de la tienda
                          if (usuarioIniciado) {
                            // Volvemos hacia atrás, ya que si tenemos usuario debe ser la pantalla de la tienda
                            Navigator.pop(this.context);
                            // Viajamos a la TiendaScreen pero esta vez hacia adelante
                            //Navigator.pushReplacementNamed(this.context, "/");
                          }
                        }
                      }
                    },
                    style: ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(Colors.white),
                      foregroundColor: WidgetStatePropertyAll(Colors.purple),
                    ),
                    child: Text("Continuar"),
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.popAndPushNamed(context, "/register");
                },
                child: Text(
                  "¿No tienes cuenta? púlsame",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
