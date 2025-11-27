import 'package:flutter/material.dart';

void main() {
  runApp(Tarea18());
}

class Tarea18 extends StatelessWidget {
  const Tarea18({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: "Tarea18", home: ListaElementos());
  }
}

class ListaElementos extends StatefulWidget {
  const ListaElementos({super.key});

  @override
  State<ListaElementos> createState() => _ListaElementosState();
}

class _ListaElementosState extends State<ListaElementos> {
  // La varible que va a almacenar el índice del contenedor que va a cambiar de color
  int indexContainer = -1;
  // La variable que va a almacenar el índice del usuario, que se inicia con el primer toque del usuario
  late double indexUser;

  // Creamos una lista que va a generar 20 containers
  List get _listaElementos => List.generate(20, (index) {
    return Container(
      color: index == indexContainer ? Colors.orangeAccent : Colors.transparent,
      child: ListTile(
        title: Text("$index"),
        trailing: Icon(Icons.accessibility_outlined),
      ),
    );
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.separated(
        itemBuilder: (context, index) {
          // IMPORTANTE: EL ÍNDICE DEL USUARIO NO PUEDE SER NUNCA MENOR A 0 AL COMIENZO
          return GestureDetector(
            // ESTAMOS TRABAJANDO CON LAS POSICIONES DEL EJE X
            /* El momento en el que el usurio va a tocar la pantalla y se detecta
            * el gesto horizontal es cuadno entra en juego esta función, nos podemos
            * quedar con la posición inicial del usuario y después compararla con
            * la posición cambiante, gracias al onHorizontalDragUpdate */
            onHorizontalDragStart: (details) {
              indexUser = details
                  .localPosition
                  .dx; // -> localPosition nos da la posición al comenzar, el primer toque, con dx obtenemos el double del eje x
            },
            /* Esta función va a actualizar por la posición que está el usuario,
            * si el usuario arrastra a la izquierda, el primaryDelta será negativo,
            * ya que 0 es la posición inical, izquierda números negativos y derecha
            * números positivos como el eje x */
            onHorizontalDragUpdate: (details) {
              if ((details.localPosition.dx - indexUser) < -100) {
                setState(() {
                  indexContainer = index;
                });
              }
            },
            child: _listaElementos.elementAt(index),
          );
        },
        separatorBuilder: (context, index) => Divider(),
        itemCount: 20,
      ),
    );
  }
}
