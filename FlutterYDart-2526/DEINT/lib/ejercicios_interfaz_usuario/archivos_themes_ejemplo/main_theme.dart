import 'package:flutter/material.dart';
import 'package:deint/ejercicios_interfaz_usuario/archivos_themes_ejemplo/example_themes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Themes Demo',
      theme: ThemeData(
        useMaterial3: true,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.green[300],
          centerTitle: true,
        ),
        scaffoldBackgroundColor: Colors.amber[200]
      ),
      routes: {
        '/': (context) => ExampleThemes(),
        '/first': (context) => ScreenFirst(),
        '/second': (context) => ScreenSecond(),
        '/third': (context) => ScreenThird(),
      },
    );
  }
}
