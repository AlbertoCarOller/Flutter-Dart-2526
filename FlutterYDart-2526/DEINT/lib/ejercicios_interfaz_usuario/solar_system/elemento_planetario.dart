import 'package:flutter/material.dart';
import 'package:deint/ejercicios_interfaz_usuario/solar_system/Planeta.dart';

class ElementoPlanetario extends StatelessWidget {
  final Planeta planeta;

  const ElementoPlanetario({super.key, required this.planeta});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Primero elemento de la Columna
        ListTile(
          title: Text(planeta.nombre),
          subtitle: Text(planeta.distancia),
          leading: Image.asset(planeta.rutaImagen),
          trailing: Icon(Icons.chevron_right),
          // Al pulsar vamos a la ventana de detalles
          onTap: () {
            /* Pasamos a detalles pasándole como argumento el planeta,
             así no será necesario en el constructor */
            Navigator.pushNamed(context, "/detalles", arguments: planeta);
          },
        ),
        // Segundo elemento de la Columna
        Divider(),
        // Tercer elemento de la Columna
        SizedBox(height: 5),
      ],
    );
  }
}
