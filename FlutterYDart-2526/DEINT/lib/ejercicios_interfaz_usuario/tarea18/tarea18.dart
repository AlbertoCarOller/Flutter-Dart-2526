import 'package:flutter/material.dart';

void main() {
  runApp(Tarea18());
}

class Tarea18 extends StatelessWidget {
  const Tarea18({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Tarea18",
      home: ListaElementos(),
    );
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
  final List _listaElementos = List.generate(20, (index) {
    return "$index";
  });

  // Con una lista de elementos no generados
  //final List _listaElementos = ["Primero", "Segundo", "Tercero"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.separated(
        // IMPORTANTE delta ES LA ACUMULACIÓN DE PÍXELES
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
              if ((details.localPosition.dx - indexUser) /*< -100*/ < -150) {
                setState(() {
                  indexContainer = index;
                });
              }
            },
            /* Esta función se queda con la última posición donde pulso el usario,
            * podemos obtener este posición, en mi caso lo hago para cuando el usuario
            * arrastre en esa posición elimine ese mismo container */
            onHorizontalDragEnd: (details) {
              if ((details.localPosition.dx - indexUser) < -150) {
                setState(() {
                  _listaElementos.removeAt(indexContainer);
                  indexContainer =
                      -1; /* -> Quitamos el índice residual después de eliminar
                   el elemento (container) porque si por ejemplo pintamos el elemento con
                   índice 5 y lo eliminamos el elemento 6 antes de eliminar pasará a
                   ser el elemento 5 y estará pintado*/
                });
              }
            },
            // El elemento de la lista
            child: Container(
              // Si el índice del container coindice con el índice del actual cambia de color
              color: index == indexContainer ? Colors.red : Colors.transparent,
              child: ListTile(
                title: Text("${_listaElementos[index]}"),
                trailing: Icon(Icons.accessibility_outlined),
              ),
            ),
          );
        },
        separatorBuilder: (context, index) => Divider(),
        itemCount: _listaElementos.length,
      ),
    );
  }
}
