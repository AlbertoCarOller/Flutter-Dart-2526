import 'package:deint/ejercicios_interfaz_usuario/base_de_datos_heroes/detalles_heroe.dart';
import 'package:deint/ejercicios_interfaz_usuario/base_de_datos_heroes/formulario_heroe.dart';
import 'package:deint/ejercicios_interfaz_usuario/base_de_datos_heroes/listado_heroes.dart';
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
      initialRoute: "/", // Ruta inicial
      // Rutas de la aplicación
      routes: {
        "/": (context) => ListadoHeroes(),
        "/formulario": (context) => FormularioHeroe(),
        "/detalles": (context) => DetallesHeroe(),
      },
    );
  }
}
