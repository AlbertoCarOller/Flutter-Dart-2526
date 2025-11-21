import 'package:flutter/material.dart';

import 'elemento_data_base.dart';

class Mapa extends StatelessWidget {
  const Mapa({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Map"),
        centerTitle: true,
        backgroundColor: Colors.purple.shade200,
      ),
      body: Center(
        child: SizedBox(
          height: 250,
          width: 250,
          child: GridView.builder(
            itemCount:
                ElementoCDataBase.elementoSize * ElementoCDataBase.elementoSize,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: ElementoCDataBase.elementoSize,
              mainAxisSpacing: 2,
              crossAxisSpacing: 2,
            ),
            itemBuilder: (context, index) {
              return Container(
                width: 25,
                height: 25,
                color: ElementoCDataBase.obtenerColor(),
              );
            },
          ),
        ),
      ),
    );
  }
}
