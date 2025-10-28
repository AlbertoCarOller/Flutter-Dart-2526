import 'package:flutter/material.dart';
import 'package:deint/ejercicios_interfaz_usuario/solar_system/Elemento_planetario.dart';
import 'package:deint/ejercicios_interfaz_usuario/solar_system/Planeta.dart';

class ListaPlanetas extends StatelessWidget {
  // Una lista de planetas
  final List<Planeta> planetasEntradas;

  const ListaPlanetas({super.key, required this.planetasEntradas});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar
      appBar: AppBar(
        title: Text("Solar System", style: TextStyle(color: Colors.white)),
        // Centramos el título
        centerTitle: true,
        backgroundColor: Colors.grey,
        // Hacemos un poco más grande el 'AppBar'
        toolbarHeight: 80,
      ),
      // Cuerpo, es una ListView.builder, es dinámica
      body: ListView.builder(
        // Contiene tantas columnas como planetas planetas/satélites haya
        itemBuilder: (context, index) {
          return ElementoPlanetario(planeta: planetasEntradas[index]);
        },
        itemCount: planetasEntradas.length,
      ),
    );
  }
}
