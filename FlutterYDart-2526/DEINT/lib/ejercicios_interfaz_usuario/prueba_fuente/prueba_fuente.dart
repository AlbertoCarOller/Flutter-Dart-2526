import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(PruebaFuente());
}

class PruebaFuente extends StatelessWidget {
  const PruebaFuente({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.green.shade400,
          centerTitle: true,
        ),
      ),
      title: "PruebaFuente",
      home: Fuente(),
    );
  }
}

class Fuente extends StatefulWidget {
  const Fuente({super.key});

  @override
  State<Fuente> createState() => _FuenteState();
}

class _FuenteState extends State<Fuente> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Aquí utilizamos el paquete de fuentes de google
        title: Text(
          "Prueba fuentes",
          style: GoogleFonts.akatab(fontWeight: FontWeight.w900),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // En este caso utilizamos fuentes directamente de los assets
            Text(
              "Utilizamos fuentes del assets",
              style: TextStyle(fontFamily: 'PlaywriteUSTradGuides'),
            ),
            Text("Utilizamos fuentes del assets",
            style: TextStyle(fontFamily: 'BungeeSpice'),),
          ],
        ),
      ),
    );
  }
}
