import 'package:flutter/material.dart';

class TemaProvider extends ChangeNotifier {
  // El tema actual es el claro por defecto, provider funciona con instancias no statics
  ThemeMode temaActual = ThemeMode.light;

  void cambiarTema() {
    // Si el tema es claro, cambiamos a oscuro
    if (temaActual == ThemeMode.light) {
      temaActual = ThemeMode.dark;
      // Si el tema es oscuro, cambiamos a claro
    } else {
      temaActual = ThemeMode.light;
    }
    // Notificamos a los consumers
    notifyListeners();
  }
}
