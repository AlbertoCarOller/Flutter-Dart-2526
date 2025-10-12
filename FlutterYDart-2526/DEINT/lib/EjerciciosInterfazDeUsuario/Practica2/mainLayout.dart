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
      // Aling nos permite alinear a nuestro gusto el widget hijo
      body: Align(
        alignment: Alignment.topCenter,
        // -> Con esto indicamos que lo queremos abajo en el centro
        // con SizedBox se crea una caja en la cual sus hijos se tendrán que adaptar en tamaño
        child: SizedBox(
          width: 450,
          height: 200,
          // -> Menos alto que largo, porque la imagen es rectangular
          child: Image.network(
            "https://images.ctfassets.net/rporu91m20dc/"
            "4dAkJ4bELVjWJ5HydnhOoI/412fe188214e68bc17ce78d5f5da9c30/"
            "76_LargeHero_LockedandLoaded_PatchNotes_1920X870.jpg",
          ),
        ),
      ),
    );
  }
}
