import 'package:flutter/material.dart';

class Pantalla3 extends StatelessWidget {
  const Pantalla3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text("GridView builder")),
      body: GridView.builder(
        /* SliverGridDelegateWithFixedCrossAxisCount() -> Define el comportamiento,
         en este caso será como el de un Count */
        /*gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 1,
          mainAxisSpacing: 2,
          crossAxisSpacing: 2,
        ),*/
        /* SliverGridDelegateWithMaxCrossAxisExtent -> Define el comportamiento,
         en este caso será como el de un Expanded*/
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          crossAxisSpacing: 2,
          mainAxisSpacing: 2,
        ),
        itemBuilder: (context, index) {
          return Container(color: Colors.purple, child: Text("$index"));
        },
        itemCount: 200,
      ),
    );
  }
}
