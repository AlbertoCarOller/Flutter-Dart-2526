import 'package:flutter/material.dart';

class Gasto {
  String concepto;
  double monto;
  String categoria;

  Gasto(this.concepto, this.monto, this.categoria);
}

class GastoDataBase {
  static List<Gasto> gastos = [];

  // Creamos un mapa con las categorías disponibles
  static Map<String, Icon> categoriasDisponibles = {
    "Transporte": Icon(Icons.emoji_transportation),
    "Comida": Icon(Icons.fastfood_rounded),
    "Ocio": Icon(Icons.person_pin_circle_sharp),
  };

  static agregarGasto(Gasto gasto) {
    gastos.add(gasto);
  }
}
