import 'dart:math';

import 'package:flutter/material.dart';

class ElementoC {
  Color color;
  bool activo;
  String nombre;

  ElementoC(this.color, this.activo, this.nombre);
}

class ElementoCDataBase {
  // El tamaño de la cuadrícula
  static int elementoSize = 3;

  // Una lista estática de los elementos
  static List<ElementoC> elementos = [
    ElementoC(Colors.yellow, false, "Dessert"),
    ElementoC(Colors.grey, false, "Rock"),
    ElementoC(Colors.blue, false, "Water"),
    ElementoC(Colors.green, false, "Forest"),
  ];

  /// Calcula los elementos activos disponibles
  static int activos() {
    return elementos.where((e) => e.activo == true).length;
  }

  // Devuelve un color de los disponibles
  static Color obtenerColor() {
    Random r = Random();
    int num = r.nextInt(activos());
    List<ElementoC> elementosActivos = elementos
        .where((element) => element.activo == true)
        .toList();
    return elementosActivos.map((e) => e.color).elementAt(num);
  }
}
