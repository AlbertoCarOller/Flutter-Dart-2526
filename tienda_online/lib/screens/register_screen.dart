import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tienda_online/utils/commons.dart';

import '../utils/functions.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  // Creamos los controllers
  final _controllerEmail = TextEditingController();
  final _controllerPassword = TextEditingController();
  final _controllerReplicaPassword = TextEditingController();

  @override
  void initState() {
    super.initState();
    _controllerEmail.addListener(() => print(_controllerEmail.text));
    _controllerPassword.addListener(() => print(_controllerPassword.text));
    _controllerReplicaPassword.addListener(
      () => print(_controllerReplicaPassword.text),
    );
  }

  @override
  void dispose() {
    _controllerEmail.dispose();
    _controllerPassword.dispose();
    _controllerReplicaPassword.dispose();
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
                  "Registrate",
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
              ),
              // Un for que va a crear los TextFormField
              for (int i = 0; i < 3; i++)
                Padding(
                  padding: EdgeInsetsGeometry.only(bottom: 12),
                  child: SizedBox(
                    width: 400,
                    child: TextFieldPersonalizado(
                      controller: i == 0
                          ? _controllerEmail
                          : i == 1
                          ? _controllerPassword
                          : _controllerReplicaPassword,
                      label: i == 0
                          ? "Introduce el email"
                          : i == 1
                          ? "Introduce la contraseña"
                          : "Vuelve a introducir la contraseña",
                      tipo: i == 0
                          ? "email_validator"
                          : i == 1
                          ? "password_validator"
                          : "replica_password",
                      controllerPassword: _controllerPassword,
                    ),
                  ),
                ),
              Padding(
                padding: EdgeInsetsGeometry.only(top: 8, bottom: 4),
                child: SizedBox(
                  width: 150,
                  child: TextButton(
                    // Al pulsar creamos una cuenta
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        // Se crea la cuenta del usuario
                        UserCredential? userCredencital = await registrarse(
                          _controllerEmail.text,
                          _controllerPassword.text,
                          this.context,
                        );
                        // Creamos el document del usuario
                        await crearInfoUser(
                          FirebaseFirestore.instance.collection("informacion"),
                          userCredencital?.user?.uid ?? "",
                        );
                        if (mounted) {
                          if (ModalRoute.of(this.context)!.isCurrent) {
                            // En caso de que sea distinto de null, navegamos
                            if (userCredencital != null) {
                              // Navegamos a TiendaScreen
                              Navigator.pop(this.context);
                            }
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
                  Navigator.popAndPushNamed(context, "/login");
                },
                child: Text(
                  "¿Tienes cuenta? púlsame",
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
