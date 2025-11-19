import 'package:flutter/material.dart';

enum Categoria { estrellas3, estrellas4, estrellas5 }

class FiltroHotel {
  static RangeValues rangoPrecios = RangeValues(0, 0);
  static Map<String, bool> extras = {
    "wifi": false,
    "parking": false,
    "piscina": false,
  };
  static Categoria? categoria;
}
