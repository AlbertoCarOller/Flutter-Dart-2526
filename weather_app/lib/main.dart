import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app/screens/history_screen.dart';
import 'package:weather_app/screens/principal_screen.dart';

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
        // Usamos la fuente que debemos para el texto de la app
        textTheme: GoogleFonts.rubikTextTheme(),
      ),
      initialRoute: "/",
      routes: {
        "/": (context) => PrincipalScreen(),
        "/history": (context) => HistoryScreen(),
      },
    );
  }
}
