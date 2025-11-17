import 'package:flutter/material.dart';

class GrupoColores {
  // Guardamos los colores en una lista
  static Map<String, Color> colores = {
    "rojo": Colors.red,
    "amarillo": Colors.yellow,
    "azul": Colors.blue,
    "verde": Colors.green,
  };

  // Creamos un mapa en el mismo orden que nos dirá si está o no activo
  static Map<String, bool> activo = {
    "rojo": false,
    "amarillo": false,
    "azul": false,
    "verde": false,
  };

  // Esta función va a devolver los colores que estén activos
   /*Iterable<MapEntry<String, Color>> getColorsActivos()  {
     return colores.entries.where((c) => activo[c.key] == true);
   }*/
}
