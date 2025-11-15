import 'package:deint/ejercicios_interfaz_usuario/base_de_datos_heroes/heroe_data.dart';
import 'package:flutter/material.dart';

class ListadoHeroes extends StatefulWidget {
  const ListadoHeroes({super.key});

  @override
  State<ListadoHeroes> createState() => _ListadoHeroesState();
}

class _ListadoHeroesState extends State<ListadoHeroes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        title: Text("Listado de Héroes"),
        // Container para limitar su tamaño
        leading: Container(
          // Para que el botoón sea más pequeño
          padding: EdgeInsets.all(10),
          child: FloatingActionButton(
            // Esta función será asíncrona, es decir espera a algo para continuar, pero no congela el programa
            onPressed: () async {
              // Espera a que se cierre el formulario
              await Navigator.pushNamed(context, "/formulario");
              // Una vez se cierre el formulario se vuelve a construir la pantalla
              setState(() {
                // Vacío, solo queremos reconstruir el build para mostrar los cambios
              });
            },
            backgroundColor: Colors.amber,
            foregroundColor: Colors.white,
            // Le damos una forma circular al botón
            shape: CircleBorder(),
            child: Text("+"),
          ),
        ),
        centerTitle: true,
      ),
      // El cuerpo va a ser un GridView.count() con 2 columnas
      body: GridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 2,
        mainAxisSpacing: 2,
        // IMPORTANTE A TENER EN CUENTA, SI LE DAS UNA LISTA YA, NO HAY QUE PONER []
        children: HeroeDatabase.getHeroes().map((e) {
          return GestureDetector(
            child: Container(
              color: Colors.amber,
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Nombre: ${e.nombre}",
                    style: TextStyle(color: Colors.white),
                  ),
                  Text(
                    e.esAliado ? "Es aliado" : "Es enemigo",
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
            onTap: () {
              // Le pasamos como argumento el objeto héroe, para poder ver sus detalles
              Navigator.pushNamed(context, "/detalles", arguments: e);
            },
          );
        }).toList(),
      ),
    );
  }
}
