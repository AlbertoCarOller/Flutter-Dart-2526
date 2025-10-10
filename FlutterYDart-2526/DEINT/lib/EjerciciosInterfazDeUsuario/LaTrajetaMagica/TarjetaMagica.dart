import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(TarjetaMagica());
}

// Creamos el widget principal
class TarjetaMagica extends StatelessWidget {
  const TarjetaMagica({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: "TarjetaMagica", home: TarjetaMagicaCuerpo());
  }
}

// Creamos el widget puente
class TarjetaMagicaCuerpo extends StatefulWidget {
  const TarjetaMagicaCuerpo({super.key});

  @override
  State<TarjetaMagicaCuerpo> createState() => _TarjetaMagicaCuerpoState();
}

// Creamos el State (realiza la interacción real)
class _TarjetaMagicaCuerpoState extends State<TarjetaMagicaCuerpo> {
  Color _color = Colors.blueAccent;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _color,
      appBar: AppBar(title: Text("Tarjeta Magica")),
      // Este widget tiene una función que va permitir pulsar y realizar una acción
      body: GestureDetector(
        onTap: () {
          setState(() {
            if (_color == Colors.blueAccent) {
              _color = Colors.lightGreenAccent;
            } else {
              _color = Colors.blueAccent;
            }
          });
        },
        child: Container(
          /* Estos valores son que se extiendan hasta donde les
           permita el padre, en este caso el body para que así
           al crear un contenedor que ocupe el body completo se
           podrá pulsar en todos lados del body, no se limitará
           por el contaoiner */
          width: double.infinity,
          height: double.infinity,
          child: Image.network(
            "https://upload.wikimedia.org/wikipedia/commons/"
            "thumb/8/89/Bandera_de_Espa%C3%B1a.svg/1200px-Bandera_de_Espa%C3%B1a.svg.png",
            scale: 4,
          ),
        ),
      ),
    );
  }
}
