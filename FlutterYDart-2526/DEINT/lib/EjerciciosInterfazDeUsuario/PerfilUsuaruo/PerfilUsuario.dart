import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(PerfilUsuario());
}

class PerfilUsuario extends StatelessWidget {
  const PerfilUsuario({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "PerfilUsuario",
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
        useMaterial3: true,
      ),
      home: Perfil(),
    );
  }
}

class Perfil extends StatelessWidget {
  const Perfil({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final colorPrimario = colorScheme.primary;
    final colorSecundario = colorScheme.secondary;
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 170,
              width: 170,
              // BoxDecoration -> Nos permite decorar y personalizar de forma avanzada el container
              decoration: BoxDecoration(
                color: colorPrimario,
                // Shape -> Nos permite darle una forma al container
                shape: BoxShape.circle,
                // DecorationImage -> Nos permite añadir una imagen que cubra el container, que se adapte
                image: DecorationImage(
                  // NetworkImage -> Nos permite elegir una imagen desde internet
                  image: NetworkImage(
                    "https://upload.wikimedia.org/wikipedia/commons/"
                    "thumb/8/89/Bandera_de_Espa%C3%B1a.svg/1200px-Bandera_de_Espa%C3%B1a.svg.png",
                  ),
                  /* BoxFit -> Ajusta la imagen a los bordes del container,
                   con cover nos aeguramos que cubra la imagen recortando las pasrtes sobrantes */
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Text("                  "),
            Text(
              "Viva España!",
              style: TextStyle(fontSize: 40, color: colorSecundario)
            ),
          ],
        ),
      ),
    );
  }
}
