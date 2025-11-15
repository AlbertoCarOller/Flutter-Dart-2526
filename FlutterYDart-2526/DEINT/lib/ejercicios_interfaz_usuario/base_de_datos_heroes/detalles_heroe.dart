import 'package:deint/ejercicios_interfaz_usuario/base_de_datos_heroes/heroe_data.dart';
import 'package:flutter/material.dart';

class DetallesHeroe extends StatelessWidget {
  const DetallesHeroe({super.key});

  @override
  Widget build(BuildContext context) {
    final heroe = ModalRoute
        .of(context)!
        .settings
        .arguments as Heroe;
    return Scaffold(
        backgroundColor: Colors.amber,
        appBar: AppBar(
          title: Text("Detalles del Heroe"),
          centerTitle: true,
        ),
        body: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(heroe.nombre,
                  style: TextStyle(color: Colors.white, fontSize: 22),),
                Text("${heroe.nivel}",
                  style: TextStyle(color: Colors.white, fontSize: 22),),
                Text(heroe.poder.name.toUpperCase(),
                  style: TextStyle(color: Colors.white, fontSize: 22),),
                Text(heroe.esAliado ? "Es aliado" : "No es aliado",
                  style: TextStyle(color: Colors.white, fontSize: 22),),
              ],
            ),
        )
    );
  }
}
