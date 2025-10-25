import 'dart:math';
import 'package:flutter/material.dart';

/// Esta función va a devolver un par con el src de la imagen
/// y el número, que está asignado a cada imagen que me servirá
/// posteriormente
MapEntry<String, int> determinar(Random num) {
  String imagen = "";
  // Generamos un número aleatorio
  int numeroReal = num.nextInt(3);
  // Cambiamos la imagen dependiendo del número
  switch (numeroReal) {
    // Papel
    case 0:
      imagen = "assets/images/paper.png";
      break;

    // Piedra
    case 1:
      imagen = "assets/images/rock.png";
      break;

    // Tijeras
    case 2:
      imagen = "assets/images/scissors.png";
  }
  // Devolvemos la nueva imagen
  return MapEntry(imagen, numeroReal);
}

/// Esta función va a devolver un String con un mensaje de quién ha ganado
String determinarGanador(int jugador1, int jugador2) {
  if ((jugador1 == 0 && jugador2 == 1) ||
      jugador1 == 1 && jugador2 == 2 || (jugador1 == 2 && jugador2 == 0)) {
    return "Jugador 1 ha ganado!!";

  } else if ((jugador1 == 1 && jugador2 == 0) ||
      jugador1 == 2 && jugador2 == 1 || (jugador1 == 0 && jugador2 == 2)) {
    return "Jugador 2 ha ganado!!";

  } else if(jugador1 == jugador2) {
    return "Empate!! Ojo cuidado";

  } else {
    return "No hay ganador todavía";
  }
}

class Juego extends StatefulWidget {
  const Juego({super.key});

  @override
  State<Juego> createState() => _JuegoState();
}

class _JuegoState extends State<Juego> {
  // Imagen que irá cambiando
  String imagen1 = "assets/images/cruzRoja.png";
  String imagen2 = "assets/images/cruzRoja.png";

  // Creamos el mensaje
  String mensaje = "";

  // Creamos los numeros
  int num1 = -1;
  int num2 = -2;

  // Número random
  Random num = Random();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pinkAccent.shade100,
      // AppBar
      appBar: AppBar(
        // Color de fondo
        backgroundColor: Color.fromARGB(255, 238, 238, 238),
        centerTitle: true,
        // Altura del AppBar
        toolbarHeight: 150,
        // Título
        title: Text(
          "Rock-Paper-Scissor",
          style: TextStyle(
            color: Color.fromARGB(255, 152, 152, 152),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      // Cuerpo
      body: Column(
        // Primera parte que contiene las bolas
        children: [
          Expanded(
            flex: 3,
            child: Container(
              padding: EdgeInsets.only(top: 150),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.only(right: 40),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text("Player 1", style: TextStyle(fontSize: 30)),
                          CircleAvatar(
                            backgroundImage: AssetImage(imagen1),
                            radius: 50,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.only(left: 40),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Player 2", style: TextStyle(fontSize: 30)),
                          CircleAvatar(
                            backgroundImage: AssetImage(imagen2),
                            radius: 50,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Column(
              children: [
                // Primer botón, 'GO!!!'
                Expanded(
                  child: Container(
                    alignment: Alignment.topCenter,
                    child: TextButton(
                      // TextButton.styleFrom dentro de style para poner estilos de forma sencilla a un TextButton
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.pink,
                      ),
                      child: Text(
                        "GO!!!",
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () {
                        // setState() importante para cambiar el estado, reconstuye el build
                        setState(() {
                          // Recibimos los datos aleatorios
                          MapEntry<String, int> valoresPrimera = determinar(
                            num,
                          );
                          MapEntry<String, int> valoresSegunda = determinar(
                            num,
                          );
                          // Cambiamos el estado de la imagen
                          imagen1 = valoresPrimera.key;
                          imagen2 = valoresSegunda.key;
                          // Actualizamos el valor de los números
                          num1 = valoresPrimera.value;
                          num2 = valoresSegunda.value;
                        });
                      },
                    ),
                  ),
                ),
                // Creamos el segundo botón 'Ver resultado'
                Expanded(
                  child: Container(
                    padding: EdgeInsets.only(bottom: 20),
                    alignment: Alignment.topCenter,
                    child: TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.pink,
                        foregroundColor: Colors.white,
                      ),
                      child: Text("Ver resultado"),
                      onPressed: () {
                        mensaje = determinarGanador(num1, num2);
                        // Pasamos a la pantalla 'resultado', pasándole el mensaje
                        Navigator.pushNamed(context, "/resultado", arguments: mensaje);
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
