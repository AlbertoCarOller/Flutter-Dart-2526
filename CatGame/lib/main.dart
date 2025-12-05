import 'package:flutter/material.dart';
import 'package:flutter_application_cat_game/glass_tile_game.dart';
import 'package:flutter_application_cat_game/home.dart';
import 'package:flutter_application_cat_game/opponents.dart';
import 'package:flutter_application_cat_game/select_avatar.dart';
import 'package:flutter_application_cat_game/terms_conditions.dart';
import 'package:flutter_application_cat_game/winner.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // Le damos un tema predeterminado a la aplicación
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.grey.shade300,
        appBarTheme: AppBarTheme(
          centerTitle: true,
          foregroundColor: Colors.white,
          backgroundColor: Color.fromRGBO(176, 32, 77, 1.0),
        ),
        useMaterial3: true,
      ),
      title: "MyApp",
      initialRoute: "/",
      routes: {
        "/": (context) => Home(),
        "/terminos": (context) => TermsConditions(),
        "/select": (context) => SelectAvatar(),
        "/opponents": (context) => Opponents(),
        "/glassGame": (context) => GlassTileGame(),
        "/winner": (context) => Winner(),
      },
    );
  }
}
