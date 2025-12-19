import 'package:flutter/material.dart';

void main() {
  runApp(Principal());
}

class Principal extends StatelessWidget {
  const Principal({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true),
      title: "Principal",
      home: Cuenta(),
    );
  }
}

class Cuenta extends StatefulWidget {
  const Cuenta({super.key});

  @override
  State<Cuenta> createState() => _CuentaState();
}

class _CuentaState extends State<Cuenta> {
  // Creamos un número que va a ser la cuenta atrás, va a empezar en 10
  int cuentaAtras = 10;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Cuando la cuenta atrás llegue a 0 el color de fondo será rojo
      backgroundColor: cuentaAtras == 0 ? Colors.red : Colors.white,
      body: Container(
        alignment: Alignment.center,
        child: GestureDetector(
          onTap: () {
            // Hacemos un for para que espere un tiempo, esperá lo que valga i
            for (int i = cuentaAtras; i > 0; i--) { // Empieza valiendo 10
              /* Esperamos lo que valga, pero el for sigue ejecutando los demás,
               entonces se crea la cuenta atrás hasta 10 para restar 1 y así sucesivamente,
                para el siguiente lo que valga 9 y así, como llega a 1, cuando pase 1 segundo resta 1 */
              Future<int>.delayed(Duration(seconds: i), () => i).then((value) {
                /* Cambiamos el estado, restamos 1, restamos el primer 1 cuando espera 1 segundo,
                * cada vez que me devuele un value  */
                setState(() {
                  cuentaAtras--;
                });
              });
            }
          },
          child: CircleAvatar(
            backgroundColor: Colors.orange.shade200,
            radius: 80,
            child: Text("$cuentaAtras", style: TextStyle(fontSize: 40)),
          ),
        ),
      ),
    );
  }
}
