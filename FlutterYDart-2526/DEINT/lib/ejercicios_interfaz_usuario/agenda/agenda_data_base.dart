import 'package:flutter/material.dart';

class Elemento {
  String nombre;
  int telefono;
  Color? color;

  Elemento(this.nombre, this.telefono, this.color);
}

class ElementoDataBase {
  static Map<String, Color> coloresDisponibles = {
    "azul": Colors.blue,
    "gris": Colors.grey,
  };

  static List<Elemento> elementos = [];

  static void agregarElemento(Elemento elemento) {
    elementos.add(elemento);
  }
}
