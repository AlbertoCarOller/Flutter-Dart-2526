import 'package:flutter/material.dart';
import 'package:deint/ejercicios_interfaz_usuario/solar_system/Planeta.dart';

class Detalles extends StatelessWidget {
  final Planeta planeta;

  const Detalles({super.key, required this.planeta});

  @override
  Widget build(BuildContext context) {
    // Recibimos por argumentos el planeta (onGenerateRoute produce conflictos)
    //Planeta planeta = ModalRoute.of(context)!.settings.arguments as Planeta;
    return Scaffold(
      // No hace fala poner un .pop porque AppBar es inteligente y crea un .pop en él
      appBar: AppBar(
        title: Text(planeta.nombre, style: TextStyle(color: Colors.white)),
        // Centramos el título
        centerTitle: true,
        backgroundColor: Colors.grey,
        // Hacemos un poco más grande el 'AppBar'
        toolbarHeight: 80,
      ),
      // Columna que ocupa todo el body
      body: Column(
        children: [
          // Imagen
          Expanded(child: Image.asset(planeta.rutaImagen)),
          // Información
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15),
              alignment: Alignment.topCenter,
              child: Text(planeta.descripcion, style: TextStyle(fontSize: 20)),
            ),
          ),
        ],
      ),
    );
  }
}
