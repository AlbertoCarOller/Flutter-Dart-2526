import 'package:deint/ejercicios_interfaz_usuario/Practica14/CafeSize.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(OpcionesCafe());
}

class OpcionesCafe extends StatelessWidget {
  const OpcionesCafe({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "OpcionesCafe",
      home: Cafe(),
      theme: ThemeData(useMaterial3: true),
    );
  }
}

class Cafe extends StatefulWidget {
  const Cafe({super.key});

  @override
  State<Cafe> createState() => _CafeState();
}

class _CafeState extends State<Cafe> {
  // Declaramos el grupo de valores inicializándolo en mediano (tamaño del café)
  CafeSize _cafeSize = CafeSize.mediano;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Creamos un for para facilitar la creación de Radios
          for (int i = 0; i < CafeSize.values.length; i++)
            OpcionSize(
              cafeSize: _cafeSize,
              cafeSizeValue: CafeSize.values.elementAt(i),
              modificadorReal: (value) {
                setState(() {
                  _cafeSize = value!;
                });
              },
            ),
        ],
      ),
    );
  }
}

/// Creamos un widget que se va a encargar de la creación de cada
/// RadioListTile, recibirá el grupo de valores y la iteración
/// actual del valor del tamaño del café
class OpcionSize extends StatelessWidget {
  // El grupo de CafeSize disponibles
  final CafeSize cafeSize;
  final Function(CafeSize?) modificadorReal;

  // El valor actual de CafeSize debido a la iteración de fuera
  final CafeSize cafeSizeValue;

  const OpcionSize({
    super.key,
    required this.cafeSize,
    required this.cafeSizeValue,
    required this.modificadorReal
  });

  @override
  Widget build(BuildContext context) {
    return RadioListTile(
      // Valor que se muestra
      value: cafeSizeValue,
      title: Text(cafeSizeValue.name.toUpperCase()),
      // Grupo de valores
      groupValue: cafeSize,
      // A que valor cambia, obviamente va a ser al valor mostrado en 'value'
      onChanged: modificadorReal,
    );
  }
}
