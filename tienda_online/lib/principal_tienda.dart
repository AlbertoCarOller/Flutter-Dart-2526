import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:tienda_online/firebase_options.dart';
import 'package:tienda_online/screens/inicio.dart';

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
    final tema = ThemeData(useMaterial3: true);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "PrincipalTienda",
      theme: tema,
      initialRoute: "/",
      routes: {
        "/": (context) => Inicio(),
      },
    );
  }
}
