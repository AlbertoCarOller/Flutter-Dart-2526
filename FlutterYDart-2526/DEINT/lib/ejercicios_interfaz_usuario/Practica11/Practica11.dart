import 'package:flutter/material.dart';

void main() {
  runApp(CuadroNumeros());
}

class CuadroNumeros extends StatelessWidget {
  const CuadroNumeros({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "CuadroNumeros",
      home: Numeros(),
      theme: ThemeData(useMaterial3: true),
    );
  }
}

class Numeros extends StatelessWidget {
  const Numeros({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: 350,
          width: 550,
          color: Colors.grey,
          // Creamos una ListView.separated() que permite crear filas con separadores personalizados, tienen índices
          child: ListView.separated(
            // Como se construye el widget que va en la fila
            itemBuilder: (context, index) {
              return Container(
                color: (index % 2 == 0) ? Colors.red : Colors.yellow,
                child: (index % 2 == 0)
                    ? Text("Número par: $index")
                    : Text("Número impar: $index"),
              );
            },
            // Como se construye el separador
            separatorBuilder: (context, index) {
              return Divider(
                color: (index % 2 == 0)
                    ? Colors.green
                    : Colors.lightGreenAccent,
              );
            },
            itemCount: 100,
          ),
        ),
      ),
    );
  }
}
