import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tienda_online/firebase_options.dart';
import 'package:tienda_online/screens/inicio.dart';
import 'package:tienda_online/screens/login_screen.dart';
import 'package:tienda_online/screens/register_screen.dart';
import 'package:tienda_online/screens/tienda_screen.dart';
import 'package:tienda_online/utils/first_screen.dart';

void main() async {
  // Contruimos el puente entre Flutter y Dart antes de iniciar el runApp()
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(PrincipalTienda());
}

class PrincipalTienda extends StatelessWidget {
  const PrincipalTienda({super.key});

  @override
  Widget build(BuildContext context) {
    final tema = ThemeData(
      useMaterial3: true,
      // La tipografía
      textTheme: GoogleFonts.aBeeZeeTextTheme(),
      appBarTheme: AppBarTheme(centerTitle: true),
    );
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "PrincipalTienda",
      theme: tema,
      initialRoute: "/",
      routes: {
        // Decidimos donde viajamos dependiendo de si está o no logueado el usuario
        "/": (context) => FirstScreen(),
        "/login": (context) => LoginScreen(),
        "/register": (context) => RegisterScreen(),
        //"/tienda_screen": (context) => TiendaScreen(),
      },
    );
  }
}
