import 'package:flutter/material.dart';

class Resumen extends StatelessWidget {
  const Resumen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Información receta"),
      centerTitle: true,
      backgroundColor: Colors.pinkAccent.shade400,),
    );
  }
}
