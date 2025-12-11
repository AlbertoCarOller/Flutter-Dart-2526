import 'package:deint/ejercicios_interfaz_usuario/gestor_inventario_tienda/detalles.dart';
import 'package:deint/ejercicios_interfaz_usuario/smart_fridge/nevera_screen.dart';
import 'package:deint/ejercicios_interfaz_usuario/smart_fridge/nuevo_alimento.dart';
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
          titleTextStyle: GoogleFonts.outfit(
            fontSize: 25,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
          centerTitle: true,
          backgroundColor: Colors.teal.shade400,
        ),
      ),
      initialRoute: "/",
      routes: {
        "/": (context) => NeveraScreen(),
        "/nuevo": (context) => NuevoAlimento(),
        "/detalles": (context) => Detalles(),
      },
    );
  }
}
