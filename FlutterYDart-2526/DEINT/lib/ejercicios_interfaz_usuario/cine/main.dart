import 'package:deint/ejercicios_interfaz_usuario/cine/asientos.dart';
import 'package:deint/ejercicios_interfaz_usuario/cine/cartelera_screen.dart';
import 'package:deint/ejercicios_interfaz_usuario/cine/detalles.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'model/cine_data_base.dart';

void main() {
  runApp(Main());
}

class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.black,
          centerTitle: true,
          titleTextStyle: GoogleFonts.acme(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
      ),
      title: "Main",
      initialRoute: "/",
      routes: {
        "/": (context) => CarteleraScreen(),
        "/detalles": (context) {
          // Recuperamos la película
          Pelicula pelicula =
              ModalRoute.of(context)!.settings.arguments as Pelicula;
          return Detalles(pelicula: pelicula);
        },
        "/asientos": (context) => Asientos(),
      },
    );
  }
}
