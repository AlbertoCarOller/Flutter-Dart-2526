import 'package:deint/ejercicios_interfaz_usuario/registro_gastos_viaje/crear_gasto.dart';
import 'package:deint/ejercicios_interfaz_usuario/registro_gastos_viaje/lista_gastos.dart';
import 'package:deint/ejercicios_interfaz_usuario/registro_gastos_viaje/opciones.dart';
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
        "/crear": (context) => CrearGasto(),
        "/gastos": (context) => ListaGastos(),
      },
    );
  }
}
