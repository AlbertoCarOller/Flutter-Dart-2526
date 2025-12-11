import 'package:deint/ejercicios_interfaz_usuario/la_expedicion_perdida/juego_expedicion.dart';
import 'package:deint/ejercicios_interfaz_usuario/la_expedicion_perdida/mochila_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(Main());
}

class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Main",
      theme: ThemeData(
        useMaterial3: true,
        appBarTheme: AppBarTheme(
          // Altura a la appBar
          toolbarHeight: 80,
          backgroundColor: Colors.brown.shade400,
          titleTextStyle: GoogleFonts.dancingScript(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
          centerTitle: true,
        ),
      ),
      initialRoute: "/",
      routes: {
        "/": (context) => MochilaScreen(),
        "/juego": (context) => JuegoExpedicion(),
      },
    );
  }
}
