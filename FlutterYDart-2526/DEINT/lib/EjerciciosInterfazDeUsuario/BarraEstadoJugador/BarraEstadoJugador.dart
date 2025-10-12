import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(PlayerState());
}

// Estructura principal
class PlayerState extends StatelessWidget {
  const PlayerState({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: "PlayerState", home: PlayerStateFuction());
  }
}

// Puente
class PlayerStateFuction extends StatefulWidget {
  const PlayerStateFuction({super.key});

  @override
  State<PlayerStateFuction> createState() => _PlayerStateFuctionState();
}

// State
class _PlayerStateFuctionState extends State<PlayerStateFuction> {
  int salud = 0;
  int defensa = 0;
  int ataque = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Row(
          // Alineamos el icono y la columna al centro
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.accessibility_new, size: 200, color: Colors.white),
            Column(
              // Centramos la columna que contiene las filas de datos
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Text(
                      "Salud: $salud",
                      style: TextStyle(fontSize: 40, color: Colors.white),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          salud++;
                        });
                      },
                      child: Icon(Icons.add),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      "Defensa: $defensa",
                      style: TextStyle(fontSize: 40, color: Colors.white),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          defensa++;
                        });
                      },
                      child: Icon(Icons.add),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      "Ataque: $ataque",
                      style: TextStyle(fontSize: 40, color: Colors.white),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          ataque++;
                        });
                      },
                      child: Icon(Icons.add),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
