import 'package:deint/ejercicios_interfaz_usuario/cine/model/cine_data_base.dart';
import 'package:flutter/material.dart';

class Asientos extends StatefulWidget {
  const Asientos({super.key});

  @override
  State<Asientos> createState() => _AsientosState();
}

class _AsientosState extends State<Asientos> {
  // Guardamos el índice del asiento que elija el usuario
  int indexAsientoSeleccionado = -1;

  @override
  Widget build(BuildContext context) {
    // Obtenemos la película de la pantalla anterior para saber los asientos ocupados y el total
    Pelicula pelicula = ModalRoute.of(context)!.settings.arguments as Pelicula;
    return Scaffold(
      appBar: AppBar(
        title: Text("Sala de ${pelicula.titulo}"),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 5),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey.shade400,
                foregroundColor: Colors.red.shade900,
              ),
              onPressed: indexAsientoSeleccionado != -1
                  ? () {
                      // Guardamos el índice en la lista de asientos seleccionados
                      pelicula.sala.asientosVendidos.add(
                        indexAsientoSeleccionado,
                      );
                      // Navegamos hacia atrás hasta encontrar la pantalla llamada '/'
                      Navigator.popUntil(context, ModalRoute.withName("/"));
                    }
                  : null,
              child: Text("Guardar"),
            ),
          ),
        ],
      ),
      body: GridView.builder(
        itemCount: pelicula.sala.numAsientos,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          // Filas de 5
          crossAxisCount: 5,
        ),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                if (!pelicula.sala.asientosVendidos.contains(index) &&
                    indexAsientoSeleccionado == -1) {
                  indexAsientoSeleccionado = index;
                  print(
                    "Se ha seleccionado el asiento $indexAsientoSeleccionado, índice grid: $index",
                  );
                } else if (indexAsientoSeleccionado == index) {
                  setState(() {
                    indexAsientoSeleccionado = -1;
                    print(
                      "Se ha deseleccioando el asiento $index, nuevo índice usuario: $indexAsientoSeleccionado",
                    );
                  });
                }
              });
            },
            child: Card(
              // El color dependerá de si está ya bloqueado, si lo ha seleccionado el usuario o si está libre
              color: pelicula.sala.asientosVendidos.contains(index)
                  ? Colors.red.shade400
                  : !pelicula.sala.asientosVendidos.contains(index) &&
                        index == indexAsientoSeleccionado
                  ? Colors.green.shade400
                  : Colors.grey.shade400,
              // El icono dependerá de lo mismo que arriba con los colores
              child: Icon(
                pelicula.sala.asientosVendidos.contains(index)
                    ? Icons.close
                    : !pelicula.sala.asientosVendidos.contains(index) &&
                          index == indexAsientoSeleccionado
                    ? Icons.person
                    : Icons.lock_open_outlined,
              ),
            ),
          );
        },
      ),
    );
  }
}
