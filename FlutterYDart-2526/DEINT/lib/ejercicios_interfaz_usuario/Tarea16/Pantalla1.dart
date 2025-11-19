import 'package:flutter/material.dart';

class Pantalla1 extends StatelessWidget {
  const Pantalla1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("GridView count"), centerTitle: true),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
                child: GridView.count(
                  crossAxisCount: 4,
                  mainAxisSpacing: 2,
                  crossAxisSpacing: 2,
                  childAspectRatio: 1, // -> La proporción ancho/alto, 1 es cuadrado perfecto
                  children: List<Widget>.generate(16, (index) {
                    return Container(color: Colors.amber);
                  }),
                ),
            ),
            ElevatedButton(onPressed: () {
              Navigator.pushNamed(context, "/pantalla2");
            }, child: Text("Siguiente"))
          ],
        )
    );
  }
}
