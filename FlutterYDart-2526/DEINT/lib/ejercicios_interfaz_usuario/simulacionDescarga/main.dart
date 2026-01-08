import 'package:deint/ejercicios_interfaz_usuario/simulacionDescarga/screen1.dart';
import 'package:deint/ejercicios_interfaz_usuario/simulacionDescarga/screen_dowload2.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(Principal());
}

class Principal extends StatelessWidget {
  const Principal({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true),
      title: "Principal",
      initialRoute: "/",
      routes: {
        "/": (context) => ScreenDowload(),
        "/screen2": (context) => ScreenDowload2(),
      },
    );
  }
}
