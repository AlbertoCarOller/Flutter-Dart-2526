import 'package:deint/ejercicios_interfaz_usuario/cine/cartelera_screen.dart';
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
      theme: ThemeData(
        useMaterial3: true,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.black,
          centerTitle: true,
          titleTextStyle: GoogleFonts.acme(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
        ),
      ),
      title: "Main",
      initialRoute: "/",
      routes: {
        "/": (context) => CarteleraScreen(),
      },
    );
  }
}
