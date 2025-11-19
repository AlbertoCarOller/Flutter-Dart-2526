import 'package:deint/ejercicios_interfaz_usuario/chef_digital/receta_data.dart';
import 'package:flutter/material.dart';

class Resumen extends StatelessWidget {
  const Resumen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<dynamic> list =
        ModalRoute.of(context)!.settings.arguments as List<dynamic>;
    // Obtenemos la receta
    final Receta receta = list.elementAt(0) as Receta;
    final void Function() actualizarEstado =
        list.elementAt(1) as void Function();
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        title: Text("Información receta"),
        centerTitle: true,
        backgroundColor: Colors.pinkAccent.shade400,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Nombre: ${receta.nombrePlato}",
                style: TextStyle(fontSize: 22, color: Colors.pinkAccent),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 40,
                children: [
                  Text(
                    "Calorías: ${receta.calorias}",
                    style: TextStyle(fontSize: 22, color: Colors.pinkAccent),
                  ),
                  Text(
                    "Grasas: ${receta.grasas}",
                    style: TextStyle(fontSize: 22, color: Colors.pinkAccent),
                  ),
                  Text(
                    "Proteinas: ${receta.proteinas}",
                    style: TextStyle(fontSize: 22, color: Colors.pinkAccent),
                  ),
                ],
              ),
              Column(
                children: receta.ingredientes
                    .map(
                      (i) => Text(
                        "Ingrediente: ${i.nombre}"
                        ", gramos: ${i.cantidadGramos}",
                        style: TextStyle(
                          fontSize: 22,
                          color: Colors.pinkAccent,
                        ),
                      ),
                    )
                    .toList(),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  actualizarEstado();
                },
                child: Text("Volver"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
