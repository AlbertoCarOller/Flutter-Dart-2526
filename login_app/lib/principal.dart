import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_app/screens/crear_cuenta_screen.dart';
import 'package:login_app/config/firebase_options.dart';
import 'package:login_app/screens/iniciar_sesion_screen.dart';
import 'package:login_app/screens/pantalla_final.dart';
import 'package:login_app/screens/screen_1.dart';

void main() async {
  /* Con esto nos aseguramos a pesar de que el main sea asíncrono que
  * se conecte Dart con Flutter antes de hacer el runApp() que es cuando
  * se hacía antes, pero tenemos en medio Firebase.initializeApp */
  WidgetsFlutterBinding.ensureInitialized();
  // Hacemos esto para conectar nuestra app con Firebase
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(Principal());
}

class Principal extends StatelessWidget {
  const Principal({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = ThemeData(
      useMaterial3: true,
      appBarTheme: AppBarTheme(centerTitle: true, backgroundColor: Colors.teal),
      textTheme: GoogleFonts.aBeeZeeTextTheme(),
    );
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: themeData,
      title: "Principal",
      initialRoute: "/",
      routes: {
        "/": (context) => Screen1(),
        "/iniciar_sesion_screen": (context) => IniciarSesionScreen(),
        "/crear_cuenta_screen": (context) => CrearCuentaScreen(),
        "/pantalla_final": (context) => PantallaFinal(),
      },
    );
  }
}
