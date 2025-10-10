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
      backgroundColor: Colors.orangeAccent,
      appBar: AppBar(
        // Con esta propiedad centramos el título dentro del appBar
        centerTitle: true,
        title: Text(
          "Profile",
          style: TextStyle(color: Colors.white, fontStyle: FontStyle.italic),
        ),
        // Establecemos el color de fondo
        backgroundColor: Colors.brown[500],
      ),
      body: Center( // -> Center solo afecta a su hijo inmediato, no al resto
        child: Image.network(
          "https://images.ctfassets.net/rporu91m20dc/"
          "4dAkJ4bELVjWJ5HydnhOoI/412fe188214e68bc17ce78d5f5da9c30/"
          "76_LargeHero_LockedandLoaded_PatchNotes_1920X870.jpg",
          scale: 5,
        ),
      ),
    );
  }
}
