/*
[] TODO: Añadir elementos y estilos de la cabecera. 
[] TODO: Crear el layout correspondiente para mostrar todos los elementos que se observan sin funcionalidad.
[] TODO: Añadir funcionalidad para que un cristal por fila sea fragil o resistente.
[] TODO: Actualizar el foco y resaltar la siguiente fila a saltar.
[] TODO: Calcular el número de intentos. 
[] TODO: Actualizar el número de intentos según vayamos errando. 
[] TODO: Mostrar mensaje cuando perdemos. 
[] TODO: Navegar a la pantalla winner.dart si ganamos. 
[] TODO: Mi código es legible y está bien comentando.
 */

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_application_cat_game/data/data_avatar.dart';

class GlassTileGame extends StatefulWidget {
  const GlassTileGame({super.key});

  @override
  State<GlassTileGame> createState() => _GlassTileGameState();
}

class _GlassTileGameState extends State<GlassTileGame> {
  /* Creamos el índice actual para colorear los bordes y saber por donde va el usuario,
   este no se reinicia para mostrar las que ha completado correctamente antes */
  int indexUser = 0;

  // Guardamos los números aleatorios para saber los que están rotos
  List<int> columnasRotas = DataAvatar.generarCristales();

  // Guardamos las vidas del usuario, en este caso tendrá las vidas que se han generado aleatoriamente
  int vidas = DataAvatar.generarVidas();

  // Creamos un índice global real del usuario, que se reinicie
  int indexUserRecord = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Glass Tile games")),
      // La columna principal
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
            // Creamos una columna que va a contener las 8 Rows
            child: Column(
              spacing: 20,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Creamos las  8 rows que va a contener las columnas
                for (int i = 0; i < 8; i++)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    spacing: 20,
                    // Creamos los 2 contenedores que va a contener cada Row
                    children: [
                      // Dentro de cada Row creamos un 'cristal'
                      for (int j = 0; j < 2; j++)
                        TextButton(
                          // Al pulsar el botón
                          onPressed: () {
                            if (indexUserRecord == i &&
                                vidas > 0 &&
                                indexUserRecord != 8) {
                              setState(() {
                                // Incrementamos el índice del usuario
                                if (indexUserRecord >= indexUser) {
                                  indexUser++;
                                }
                                indexUserRecord++;
                                /* indicesColumnasRotas.add(roto); -> No se puede hacer
                                * ya que el tiempo del que lo guarda al que lo comprueba
                                * es mínimo y da problemas */
                                // Si el usuario pisa un cristal y se rompe se le resta 1 de vida
                                if (columnasRotas.elementAt(i) == j) {
                                  // Restamos una vida al usuario
                                  vidas--;
                                  // Volvemos a empezar
                                  indexUserRecord = 0;
                                }
                              });
                            }
                            // Si el usuario llega hasta el final sin perder todas sus vidas viajamos
                            // DEBE SER 8 PORQUE CUANDO ACIERTA EN EL ÚLTIMO SE SUMA A 8 EL ÍNDICE
                            if (indexUserRecord == 8) {
                              Navigator.pushNamed(context, "/winner");
                            }
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color:
                                  /* En caso de que el índice hasta donde ha llegado el usuario
                                  * sea mayor que i, que es el índice de esa fila y coincida
                                  * que sea el cristal roto (mismo número de Row que de número
                                  * generado en la lista para esa columna concreta) se pinta
                                  * de blanco para simular la destrución del cristal */
                                  indexUser > i &&
                                      columnasRotas.elementAt(i) == j
                                  ? Colors.white
                                  : Colors.grey.shade500,
                              border: Border.all(
                                width: 2,
                                // Controlamos el color de los bordes
                                color: indexUserRecord != i
                                    ? Colors.black
                                    : Color.fromRGBO(176, 32, 77, 1.0),
                              ),
                            ),
                            height: 50,
                            width: 150,
                          ),
                        ),
                    ],
                  ),
              ],
            ),
          ),
          // Este es el apartado donde sale el avatar del jugador y las vidas
          Padding(
            padding: const EdgeInsets.only(top: 40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "${DataAvatar.obetenerListaAvatares().elementAt(DataAvatar.indexElegido).image}",
                  height: 32,
                ),
                Text(
                  // En caso de que el usuario se quede sin vidas en vez de mostrar las vidas le mostramos 'LOOSER'
                  vidas != 0 ? "$vidas" : "LOOSER",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
