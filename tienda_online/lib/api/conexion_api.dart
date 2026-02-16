import 'dart:convert';

import 'package:http/http.dart' as http;

import 'Producto.dart';

class ConexionApi {
  /// Esta función va a cargar los productos en una lista
  /// desde la API y va a devolver esta lista
  static Future<List<Producto>> cargarProductos() async {
    // Primero mediante la URL cargamos en un mapa los datos de la API
    final response = await http.get(
      Uri.parse("https://fakestoreapi.com/products"),
    );
    // Si la respuesta de la API es correcta cargamos el map
    if (response.statusCode == 200) {
      // Cargamos el JSON en una lista porque empieza por '[]' la API
      List<dynamic> list = jsonDecode(response.body);
      // Recorremos la lista de mapas, cada mapa es un producto
      return list.map((e) => Producto.fromJson(e)).toList();
    }
    // Devolvemos una lista vacía
    return [];
  }
}
