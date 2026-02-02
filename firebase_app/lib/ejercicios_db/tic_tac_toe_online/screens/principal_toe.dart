import 'package:firebase_app/ejercicios_db/tic_tac_toe_online/screens/inicio_nickname.dart';
import 'package:firebase_app/ejercicios_db/tic_tac_toe_online/screens/juego.dart';
import 'package:firebase_app/ejercicios_db/tic_tac_toe_online/screens/menu_toe.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import '../../../firebase_options2.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(PrincipalToe());
}

class PrincipalToe extends StatelessWidget {
  const PrincipalToe({super.key});

  @override
  Widget build(BuildContext context) {
    final tema = ThemeData(
      useMaterial3: true,
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.blue.shade300,
        centerTitle: true,
      ),
    );
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: tema,
      title: "Principal",
      initialRoute: "/",
      routes: {
        "/": (context) => InicioNickname(),
        "/menu": (context) => MenuToe(),
        "/juego": (context) => Juego(),
      },
    );
  }
}
