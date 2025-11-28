import 'package:flutter/material.dart';

void main() {
  runApp(Tarea19());
}

class Tarea19 extends StatelessWidget {
  const Tarea19({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: "Tarea19", home: TareasBorrar());
  }
}

class TareasBorrar extends StatefulWidget {
  const TareasBorrar({super.key});

  @override
  State<TareasBorrar> createState() => _TareasBorrarState();
}

class _TareasBorrarState extends State<TareasBorrar> {
  final _listaTareas = List.generate(20, (index) => "Tarea $index");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.separated(
        itemBuilder: (context, index) {
          /* Dismissible -> Este widget tiene la funcionalidad de arrastrar el elemento
          * a la dirección que queramos para eliminar un elemento, no es necesario controlar
          * los índices, se le puede editar la dirección y el color de fondo al eliminar */
          return Dismissible(
            // Función para el borrado
            onDismissed: (direction) {
              setState(() {
                // Se borra si la direción es de izquierda a derecha, en este caso no es necesaria la comprobación
                if (direction == DismissDirection.endToStart) {
                  _listaTareas.removeAt(index);
                }
              });
            },
            background: Container(color: Colors.red),
            // direction -> Para obligarle a que solo tenga una dirección
            direction: DismissDirection.endToStart,
            key: /*UniqueKey() -> Key única que genera flutter, vamos a poner una clave
            que sea directamente el elemento para que no dé error, si ponemos un int da 
            error*/ ValueKey(
              _listaTareas.elementAt(index),
            ),
            child: ListTile(
              title: Text(_listaTareas.elementAt(index)),
              trailing: Icon(Icons.work),
            ),
          );
        },
        separatorBuilder: (context, index) => Divider(),
        itemCount: _listaTareas.length,
      ),
    );
  }
}
