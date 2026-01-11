import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_app/iniciar_sesion_screen.dart';
import 'package:login_app/screen_1.dart';

void main() {
  runApp(Principal());
}

class Principal extends StatelessWidget {
  const Principal({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = ThemeData(
      useMaterial3: true,
      appBarTheme: AppBarTheme(centerTitle: true, backgroundColor: Colors.teal),
      textTheme: GoogleFonts.aboretoTextTheme(),
    );
    return MaterialApp(
      theme: themeData,
      title: "Principal",
      initialRoute: "/",
      routes: {
        "/": (context) => Screen1(),
        "/inciar_sesion_screen": (context) => IniciarSesionScreen(),
      },
    );
  }
}
