/*
[] TODO: Añadir elementos y estilos de la cabecera. 
[] TODO: Crear y añadir elementos y estilos de un personaje. 
[] TODO: Crear el layout correspondiente para mostrar todos los personajes disponibles. 
[] TODO: Funcionalidad para seleccionar y quitar la selección de un personaje. 
[] TODO: Mostrar el mensaje cuando se selecciona un personaje. 
[] TODO: Funcionalidad del botón de la parte superior derecha.
[] TODO: Mi código es legible y está bien comentando.
 */

import 'package:flutter/material.dart';
import 'package:flutter_application_cat_game/data/data_avatar.dart';

class SelectAvatar extends StatefulWidget {
  const SelectAvatar({super.key});

  @override
  State<SelectAvatar> createState() => _SelectAvatarState();
}

class _SelectAvatarState extends State<SelectAvatar> {
  // Creamos una lista con los circle avatar
  List get _listaCircles =>
      List.generate(DataAvatar.obetenerListaAvatares().length, (index) {
        return CircleAvatar(
          backgroundColor: index == DataAvatar.indexElegido
              ? Color.fromRGBO(176, 32, 77, 1.0)
              : Color.fromRGBO(14, 83, 98, 1.0),
          child: Image(
            image: AssetImage(
              "${DataAvatar.obetenerListaAvatares().elementAt(index).image}",
            ),
            width: 64,
          ),
        );
      });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Choose your avatar"),
        actions: [
          IconButton(
            onPressed: () {
              if (DataAvatar.indexElegido != -1) {
                // Enviamos el índice para saber al oponente que hay que descartar
                Navigator.pushNamed(context, "/opponents");
              }
            },
            icon: Icon(Icons.sports_mma_rounded),
          ),
        ],
      ),
      body: GridView.builder(
        itemCount: DataAvatar.numOponentes,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisExtent: 128,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          crossAxisCount: 3,
        ),
        itemBuilder: (context, index) {
          return GestureDetector(
            onLongPress: () {
              if (DataAvatar.indexElegido == -1) {
                setState(() {
                  DataAvatar.indexElegido = index;
                });
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    action: SnackBarAction(
                      label: "Cerrar",
                      onPressed: () {
                        /*Se cierra sin poner nada, flutter ya sabe que debe cerrase
                        al llamar a SnackBarAction */
                      },
                    ),
                    content: Text(
                      "Acabas de sumplantar a"
                      " ${DataAvatar.obetenerListaAvatares().elementAt(index).firstName}",
                    ),
                    duration: Duration(seconds: 2),
                  ),
                );
              }
            },
            onDoubleTap: () {
              if (DataAvatar.indexElegido == index) {
                setState(() {
                  DataAvatar.indexElegido = -1;
                });
              }
            },
            child: _listaCircles.elementAtOrNull(index),
          );
        },
      ),
    );
  }
}
