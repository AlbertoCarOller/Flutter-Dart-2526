import 'package:flutter/material.dart';

import '../commons.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // Creamos los controllers
  final _controllerEmail = TextEditingController();
  final _controllerPassword = TextEditingController();

  @override
  void initState() {
    super.initState();
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
                      igualReplica: false,
                    ),
                  ),
                ),
              Padding(
                padding: EdgeInsetsGeometry.only(top: 8, bottom: 4),
                child: SizedBox(
                  width: 150,
                  child: TextButton(
                    onPressed: () {},
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
