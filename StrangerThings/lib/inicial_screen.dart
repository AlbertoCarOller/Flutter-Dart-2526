import 'package:flutter/material.dart';
import 'package:hawkinlab/models/stranger_character.dart';

class InicialScreen extends StatefulWidget {
  const InicialScreen({super.key});

  @override
  State<InicialScreen> createState() => _InicialScreenState();
}

class _InicialScreenState extends State<InicialScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeUpside.upside == true ? Colors.black : Colors.white,
      body: Column(
        children: [
          // La imagen de Netflix que ocupará un 80% de la pantalla
          Expanded(
            flex: 8,
            child: GestureDetector(
              // Si se mantiene pulsada la imagen vamos a la lista de pesonajes (Otra pantalla)
              onLongPress: () {
                Navigator.pushNamed(context, "/lab");
              },
              child: Image.asset("lib/assets/images/logo_netflix.png"),
            ),
          ),
          // El Switch que ocupa el 20%
          Expanded(
            flex: 2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "Upside Down",
                  style: TextStyle(
                    color: ThemeUpside.upside == true
                        ? Colors.redAccent
                        : Colors.black87,
                    fontSize: 20,
                  ),
                ),
                Switch(
                  activeThumbColor: Colors.redAccent,
                  activeTrackColor: Colors.white,
                  value: ThemeUpside.upside,
                  // Cambiamos esta varible que afecta al resto de pantalla a cuanto a los colores
                  onChanged: (value) {
                    setState(() {
                      ThemeUpside.upside = !ThemeUpside.upside;
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
