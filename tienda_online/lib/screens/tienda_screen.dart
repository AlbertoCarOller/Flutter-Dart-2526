import 'package:flutter/material.dart';

class TiendaScreen extends StatefulWidget {
  const TiendaScreen({super.key});

  @override
  State<TiendaScreen> createState() => _TiendaScreenState();
}

class _TiendaScreenState extends State<TiendaScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // FloatingActionButton, botón flotante en la parte derecha izquierda
      floatingActionButton: IconButton(
        style: ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(Colors.black54),
          foregroundColor: WidgetStatePropertyAll(Colors.white),
        ),
        onPressed: () {},
        icon: Icon(Icons.shopping_bag_rounded),
      ),
      appBar: AppBar(
        title: Image.asset("assets/images/kivonLogoSinFondo.png", scale: 4),
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.filter_alt_rounded),
        ),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.person))],
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisSpacing: 2,
          crossAxisCount: 5,
        ),
        itemBuilder: (context, index) {
          return Card(color: Colors.purple.shade200, elevation: 4);
        },
        itemCount: 20,
      ),
    );
  }
}
