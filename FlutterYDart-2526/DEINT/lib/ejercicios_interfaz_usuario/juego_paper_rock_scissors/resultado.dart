import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  const Resultado({super.key});

  @override
  Widget build(BuildContext context) {
    // Aquí recibimos el mensaje a impirmir, hay que castear cuando recibimos por arguments
    String? mensaje = ModalRoute
        .of(context)!
        .settings
        .arguments as String?;
    return Scaffold(
      backgroundColor: Colors.amberAccent.shade100,
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.only(top: 20),
              child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.orange,
                  foregroundColor: Colors.white,
                ),
                child: Text("Volver"),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              alignment: Alignment.center,
              child:
              // Texto que anuncia el ganador
              Text(
                "$mensaje",
                style: TextStyle(
                  color: Colors.orange,
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          // Icono de celebración
          Expanded(
            child: Container(
              alignment: Alignment.topCenter,
              child: Icon(
                Icons.celebration,
                size: 150,
                color: Colors.amberAccent.shade400,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
