import 'package:deint/ejercicios_interfaz_usuario/gestor_inventario_tienda/inventario_screen.dart';
import 'package:deint/ejercicios_interfaz_usuario/gestor_inventario_tienda/nuevo.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(Main());
}

class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.grey.shade400,
          centerTitle: true,
          titleTextStyle: TextStyle(fontFamily: 'BungeeSpice', fontSize: 30),
        ),
      ),
      title: "Main",
      initialRoute: "/",
      routes: {
        "/": (context) => InventarioScreen(),
        "/nuevo": (context) => Nuevo(),
      },
    );
  }
}
