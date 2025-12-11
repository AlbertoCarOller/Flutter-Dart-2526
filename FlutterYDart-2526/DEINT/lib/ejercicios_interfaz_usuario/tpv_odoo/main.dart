import 'package:deint/ejercicios_interfaz_usuario/tpv_odoo/comercio_screen.dart';
import 'package:deint/ejercicios_interfaz_usuario/tpv_odoo/total.dart';

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
      theme: ThemeData(
        useMaterial3: true,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.purple.shade500,
          titleTextStyle: GoogleFonts.aboreto(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: 25,
          ),
          centerTitle: true,
        ),
      ),
      initialRoute: "/",
      routes: {
        "/": (context) => ComercioScreen(),
        "/total": (context) => Total(),
      },
    );
  }
}
