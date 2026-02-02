import 'package:deint/ejercicios_interfaz_usuario/ejercicico_semantica_1/imagenes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(Principal());
}

class Principal extends StatelessWidget {
  const Principal({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "PrincipalSemantica",
      theme: ThemeData(
        useMaterial3: true,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.green.shade300,
          centerTitle: true,
        ),
      ),
      initialRoute: "/",
      routes: {
        "/": (context) => Imagenes()
      },
    );
  }
}
