/*
[] TODO: Añadir elementos y estilos de la cabecera. 
[] TODO: Crear y añadir elementos y estilos de un personaje. 
[] TODO: Crear el layout correspondiente para mostrar todos los personajes disponibles. 
[] TODO: Funcionalidad para seleccionar y quitar la selección de un personaje. 
[] TODO: Actualizar contador situado en la parte superior derecha. 
[] TODO: Mostrar el mensaje cuando se intenta seleccionar más de los personajes admitidos. 
[] TODO: Mostrar el boton para pasar a la siguiente pantalla. 
[] TODO: Se mantienen los estilos de los elementos seleccionados cuando hacemos scroll. 
[] TODO: Mi código es legible y está bien comentando.
 */

import 'package:flutter/material.dart';
import 'package:flutter_application_cat_game/data/avatar.dart';
import 'package:flutter_application_cat_game/data/data_avatar.dart';

class Opponents extends StatefulWidget {
  const Opponents({super.key});

  @override
  State<Opponents> createState() => _OpponentsState();
}

class _OpponentsState extends State<Opponents> {
  // Creamos el controlador scroll
  ScrollController sc = ScrollController();

  // Guardamos en una lista los oponentes disponibles
  List<Avatar> oponentes = DataAvatar.obtenerOponentes();

  // Creamos una lista de los oponentes seleccionados
  List<Avatar> oponentesList = [];

  @override
  void initState() {
    super.initState();
    sc.addListener(() => print(sc.position.pixels));
  }

  @override
  void dispose() {
    sc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Choose your opponents"),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 4),
            child: Text("${oponentesList.length}/6"),
          ),
        ],
      ),
      // Contenedor para centrar la 'lazyRow' por así llamarla
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SingleChildScrollView(
            // Le decimos que la dirección va a ser horizontal
            scrollDirection: Axis.horizontal,
            controller: sc,
            child: Row(
              children: [
                for (int i = 0; i < oponentes.length; i++)
                  GestureDetector(
                    // Se selecciona un personaje
                    onTap: () {
                      // Si hay menos de 6 elementos se puede añadir un oponente
                      if (oponentesList.length < 6) {
                        setState(() {
                          // Se añade a la lista de oponentes que van a pasar el oponente seleccionado
                          oponentesList.add(oponentes.elementAt(i));
                        });
                      }
                      // En caso de que se hayan elegido los 6 oponentes se muestra
                      if (oponentesList.length == 6) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: Colors.deepOrangeAccent,
                            content: Text(
                              "Máximo de oponentes seleccionados",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        );
                      }
                    },
                    // Se quita la selección
                    onDoubleTap: () {
                      // Si contiene el oponente entra
                      if (oponentesList.contains(oponentes.elementAt(i))) {
                        setState(() {
                          // Eliminamos el oponente
                          oponentesList.removeAt(i);
                        });
                      }
                    },
                    child: SizedBox(
                      width: 300,
                      height: 300,
                      child: Card(
                        // Se comprueba si el oponente está elegido
                        color: oponentesList.contains(oponentes.elementAt(i))
                            ? Color.fromRGBO(176, 32, 77, 1.0)
                            : Color.fromRGBO(14, 83, 98, 1.0),
                        child: Stack(
                          children: [
                            Positioned(
                              right: 5,
                              left: 5,
                              top: 20,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "I´m ${oponentes.elementAt(i).firstName}",
                                    style: TextStyle(
                                      color: Colors.grey.shade300,
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    "${oponentes.elementAt(i).lastName}",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 40,
                                      color: Colors.teal.shade500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Positioned(
                              right: 5,
                              bottom: 5,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "${oponentes.elementAt(i).jobTitle}",
                                    style: TextStyle(
                                      color: Colors.grey.shade300,
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    "${oponentes.elementAt(i).age}",
                                    style: TextStyle(
                                      color: Colors.grey.shade300,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Positioned(
                              bottom: 0,
                              child: Image.asset(
                                height: 160,
                                width: 160,
                                "${oponentes.elementAt(i).image}",
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsetsGeometry.only(top: 10),
            width: 200,
            height: 40,
            child: oponentesList.length == 6
                ? TextButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey.shade300,
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, "/glassGame");
                    },
                    child: Text(
                      "Here we go!!",
                      style: TextStyle(color: Colors.blue),
                    ),
                  )
                : null,
          ),
        ],
      ),
    );
  }
}
