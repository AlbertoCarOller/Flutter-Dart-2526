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
      /*appBar: AppBar(
        // Con esta propiedad centramos el título dentro del appBar
        centerTitle: true,
        title: Text(
          "Profile",
          style: TextStyle(color: Colors.white, fontStyle: FontStyle.italic),
        ),
        // Establecemos el color de fondo
        backgroundColor: Colors.brown[500],
      ), */
      body: SafeArea(
        child: Center(
          child: Column(
            // Con esta propiedad le da el tamaño máximo vertical, ya que es el main
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                  alignment: Alignment.bottomLeft,
                  width: 200,
                  height: 200,
                  color: Colors.red,
              ),
              Container(
                width: 600,
                height: 200,
                color: Colors.amberAccent,
              )
            ],
          ),
        ),
      ),
      // Aling nos permite alinear a nuestro gusto el widget hijo
      /*body: Align(
        //alignment: Alignment.center, // -> Con esto indicamos que lo queremos abajo en el centro
        // Con SafeArea definimos que esté en un lugar seguro que no pise información del dispositivo (hora, etc)
        child: SafeArea(
          // con SizedBox se crea una caja en la cual sus hijos se tendrán que adaptar en tamaño
          child: Container(
            color: Colors.white,
            // Indicamos el margen, que es el margen entre el Container y su padre
            margin: EdgeInsetsGeometry.only(left: 100),
            // El padding es el margen dentro del padre que tiene con su hijo
            padding: EdgeInsetsGeometry.all(30),
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
      ),*/
    );
  }
}
