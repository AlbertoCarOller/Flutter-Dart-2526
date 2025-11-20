import 'package:deint/ejercicios_interfaz_usuario/agenda/crear.dart';
import 'package:deint/ejercicios_interfaz_usuario/agenda/opciones.dart';
import 'package:deint/ejercicios_interfaz_usuario/galeria_de_fotos/lista_agenda.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(Principal());
}

class Principal extends StatelessWidget {
  const Principal({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Principal",
      initialRoute: "/",
      routes: {
        "/": (context) => Opciones(),
        "/crear": (context) => Crear(),
        "/agenda": (context) => ListaAgenda(),
      },
    );
  }
}
