import 'package:deint/ejercicios_interfaz_usuario/gestor_tareas/formulario_tarea.dart';
import 'package:deint/ejercicios_interfaz_usuario/gestor_tareas/lista_tareas.dart';
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
        "/": (context) => ListaTareas(),
        "/crear": (context) => FormularioTarea()
      },
    );
  }
}
