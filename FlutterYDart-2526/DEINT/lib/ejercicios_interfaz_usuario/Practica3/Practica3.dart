import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(PruebaLayout());
}

class PruebaLayout extends StatelessWidget {
  const PruebaLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: "Layout", home: Layout());
  }
}

class Layout extends StatelessWidget {
  const Layout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      appBar: AppBar(
        backgroundColor: Colors.green,
        // title acepta cualquier widget
        title: Row(
          // Le decimos que coga el mayor espacio posible (appBar completo)
          mainAxisSize: MainAxisSize.max,
          // Esto quiere decir que el espacio entre los hijos se reparta de forma equitativa
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("9:17", style: TextStyle(fontSize: 30)),
            Text("Movistar", style: TextStyle(fontSize: 30)),
          ],
        ),
      ),
      body: Row(
        // Le damos el tamaño del body a la Row
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(width: 100, height: double.infinity, color: Colors.red),
          Expanded(
            child: Column(
              // Centramos
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(color: Colors.amber, width: 100, height: 100),
                Container(color: Colors.yellow, width: 100, height: 100),
              ],
            ),
          ),
          Container(
            height: double.infinity,
            width: 100,
            color: Colors.blueAccent,
          ),
        ],
      ),
    );
  }
}
