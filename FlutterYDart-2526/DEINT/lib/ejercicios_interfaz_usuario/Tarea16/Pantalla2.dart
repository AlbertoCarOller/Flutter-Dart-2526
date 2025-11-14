import 'package:flutter/material.dart';

class Pantalla2 extends StatelessWidget {
  const Pantalla2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("GridView count"), centerTitle: true),
      body: GridView.extent(
        maxCrossAxisExtent: 250,
        /* -> Píxeles que ocupa cada elemento como máximo,
         intentará llegar a ese tamaño */
        crossAxisSpacing: 2,
        mainAxisSpacing: 2,
        children: List.generate(16, (index) {
          return Container(color: Colors.green);
        }),
      ),
    );
  }
}
