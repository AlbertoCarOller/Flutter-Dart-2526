import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(CuadroDeFallout());
}

class CuadroDeFallout extends StatelessWidget {
  const CuadroDeFallout({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "CuadroDeFallout",
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.orangeAccent),
      ),
      home: Cuadro(),
    );
  }
}

class Cuadro extends StatelessWidget {
  const Cuadro({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Fallout",
              // GoogleFonts -> Clase que nos permite editar el texto, darle una fuente, pero este es de google
              style: GoogleFonts.fugazOne(
                fontSize: 30,
                color: Colors.amber.shade600,
              ),
            ),
            Image(
              image: NetworkImage("https://i.imgur.com/CvWtPzp.png", scale: 8),
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          // Color de fondo
          Container(color: Colors.orangeAccent.shade100),
          Positioned.fill(
            // Imagen con cierta opacidad
            child: Opacity(
              opacity: 0.16,
              child: Image(
                fit: BoxFit.cover,
                image: NetworkImage(
                  "https://images.ctfassets.net/rporu91m20dc/"
                  "fze7Ze6DrhjVxoIEhBwRz/d222487a4dccc7dea521860b9133cb86/F76_S13_LCARD_776x470.jpg",
                ),
              ),
            ),
          ),
          Column(
            children: [
              // Cuadro de filas y columnas, con .count metemos nostros manualmente los hijos
              Expanded(
                child: GridView.count( // TODO: por arreglar la expansión incontrolada del grid
                  // Número de columnas
                  crossAxisCount: 4,
                  // Espacio entre columnas
                  crossAxisSpacing: 4,
                  // Espacio entre filas
                  mainAxisSpacing: 4,
                  children: [
                    Text(
                      "Fallout 4",
                      style: GoogleFonts.fugazOne(color: Colors.amber.shade800),
                    ),
                    Container(color: Colors.amberAccent),
                    Container(color: Colors.amberAccent),
                    Container(color: Colors.amberAccent),
                    Text(
                      "Fallout New Vegas",
                      style: GoogleFonts.fugazOne(color: Colors.amber.shade800),
                    ),
                    Container(color: Colors.amberAccent),
                    Container(color: Colors.amberAccent),
                    Container(color: Colors.amberAccent),
                    Text(
                      "Fallout 76",
                      style: GoogleFonts.fugazOne(color: Colors.amber.shade800),
                    ),
                    Container(color: Colors.amberAccent),
                    Container(color: Colors.amberAccent),
                    Container(color: Colors.amberAccent),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
