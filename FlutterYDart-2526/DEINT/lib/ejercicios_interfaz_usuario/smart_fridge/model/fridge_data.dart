import 'package:flutter/material.dart';

enum Categoria {
  carnes(Colors.brown, Icon(Icons.set_meal, color: Colors.white)),
  frutas(
    Colors.green,
    Icon(Icons.health_and_safety_outlined, color: Colors.white),
  ),
  lacteos(Colors.grey, Icon(Icons.water_drop, color: Colors.white)),
  bebidas(Colors.blue, Icon(Icons.local_drink, color: Colors.white));

  final Color colorC;
  final Icon iconC;

  const Categoria(this.colorC, this.iconC);
}

class Alimento {
  String nombre;
  Categoria categoria;
  double cantidad;
  int diasParaCaducar;

  Alimento(this.nombre, this.categoria, this.cantidad, this.diasParaCaducar);
}

class Nevera {
  static List<Alimento> alimentos = [
    Alimento("Ternera", Categoria.carnes, 3.4, 5),
    Alimento("Pollo", Categoria.carnes, 12.8, 2),
    Alimento("Fresa", Categoria.frutas, 4.7, 12),
    Alimento("Frambuesa", Categoria.frutas, 9.5, 3),
    Alimento("Leche", Categoria.lacteos, 2, 15),
    Alimento("Queso", Categoria.lacteos, 3, 12),
    Alimento("Coca-Cola", Categoria.bebidas, 2, 2),
    Alimento("Pepsi", Categoria.bebidas, 4, 9),
    Alimento("Jamón", Categoria.carnes, 4.8, 12),
    Alimento("Yogurt", Categoria.lacteos, 7.3, 6),
  ];
}
