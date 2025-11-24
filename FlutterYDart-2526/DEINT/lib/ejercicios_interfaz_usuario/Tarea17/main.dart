import 'package:deint/ejercicios_interfaz_usuario/Tarea17/create.dart';
import 'package:deint/ejercicios_interfaz_usuario/Tarea17/lista_num.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(Main());
}

class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.green,
          foregroundColor: Colors.white,
          centerTitle: true,
        ),
      ),
      title: "Main",
      initialRoute: "/",
      routes: {
        "/": (context) => ListaNum(),
        "/num": (context) => Create()
      },
    );
  }
}
