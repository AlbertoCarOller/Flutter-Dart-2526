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
      backgroundColor: Colors.redAccent,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              height: 200,
              width: 200,
              color: Colors.grey,
              //TODO: terminar ejercicio
            )
          ],
        ),
      ),
    );
  }
}
