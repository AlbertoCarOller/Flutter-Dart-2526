import 'package:flutter/material.dart';
import 'package:hawkinlab/inicial_screen.dart';
import 'package:hawkinlab/lab_screen.dart';
import 'package:hawkinlab/pantalla_personaje.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // Nos creamos un theme personalizado
    final ThemeData themeStranger = ThemeData(
      // El tema de los textos vt323TextTheme
      textTheme: GoogleFonts.vt323TextTheme(),
      // Usar material 3
      useMaterial3: true,
      // AppBarTheme
      appBarTheme: AppBarTheme(centerTitle: true),
    );
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: themeStranger,
      /*theme: ThemeData(
        appBarTheme: AppBarTheme(centerTitle: true),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),*/
      initialRoute: "/",
      routes: {
        "/": (context) => InicialScreen(),
        "/lab": (context) => LabScreen(),
        "/personaje": (context) => PantallaPersonaje(),
      },
    );
  }
}
