import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  // Ejecutamos nuestro porgrama
  runApp(CambiaColorV2());
}

// Creamos el widget principal del programa
class CambiaColorV2 extends StatelessWidget {
  const CambiaColorV2({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: "CambiaColorV2", home: CambioColorV2());
  }
}

/* Creamos la primera estructura del widget cambiante, esto es como un puente
 entre el widget principal y la definición del widget cambiante */
class CambioColorV2 extends StatefulWidget {
  const CambioColorV2({super.key});

  @override
  State<CambioColorV2> createState() => _CambioColorV2State();
}

// Creamos la estructura que realmente hace los cambios
class _CambioColorV2State extends State<CambioColorV2> {
  Color _colors = Colors.red;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Creamos un cuerpo y lo que esté dentro de este estará centrado
      body: Center(
        // Colocamos una imagen a partir de un enlace de internet
        child: Image.network(
          "https://upload.wikimedia.org/wikipedia/commons/"
          "thumb/8/89/Bandera_de_Espa%C3%B1a.svg/1200px-Bandera_de_Espa%C3%B1a.svg.png",
          scale: 2,
        ),
      ),
      backgroundColor: _colors,
      appBar: AppBar(
        title: Text(
          "VIVA ESPAÑA",
          style: TextStyle(color: Colors.red, fontFamily: 'San Francisco'),
        ),
        backgroundColor: Colors.white,
      ),
      /* onPressed: () {}, es una función anónima que va a definir el
       comportamiento del botón al pulsar */
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Al pulsar se va a cambiar el color del fondo
          setState(() {
            if (_colors == Colors.red) {
              _colors = Colors.yellow;
            } else {
              _colors = Colors.red;
            }
          });
        },
        backgroundColor: Colors.brown,
        hoverColor: Colors.orange,
        splashColor: Colors.brown,
        child: Icon(Icons.accessibility_new_outlined),
      ),
    );
  }
}
