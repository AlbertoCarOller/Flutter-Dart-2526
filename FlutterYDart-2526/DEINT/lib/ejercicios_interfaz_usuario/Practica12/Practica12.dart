import 'package:flutter/material.dart';

void main() {
  runApp(NumerosPares());
}

class NumerosPares extends StatelessWidget {
  const NumerosPares({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Numeros Pares",
      home: Pares(),
      theme: ThemeData(useMaterial3: true),
    );
  }
}

class Pares extends StatelessWidget {
  const Pares({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.separated(
        itemBuilder: (context, index) {
          // Multiplicamos por 2 para que salgan los números pares
          return Text("${(index + 1) * 2}");
        },
        separatorBuilder: (context, index) {
          return Divider(color: Colors.blue, thickness: 5,);
        },
        itemCount: 100,
      ),
    );
  }
}
