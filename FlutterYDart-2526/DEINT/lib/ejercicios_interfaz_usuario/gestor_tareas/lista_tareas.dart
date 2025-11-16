import 'package:deint/ejercicios_interfaz_usuario/gestor_tareas/tarea.dart';
import 'package:flutter/material.dart';

class ListaTareas extends StatefulWidget {
  const ListaTareas({super.key});

  @override
  State<ListaTareas> createState() => _ListaTareasState();
}

class _ListaTareasState extends State<ListaTareas> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan.shade100,
      appBar: AppBar(
        title: Text("Mis tareas"),
        centerTitle: true,
        leading: Container(
          padding: EdgeInsets.all(10),
          child: FloatingActionButton(
            onPressed: () async {
              await Navigator.pushNamed(context, "/crear");
              setState(() {});
            },
            backgroundColor: Colors.cyan,
            child: Text("+"),
          ),
        ),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Column(
            children: [
              CheckboxListTile(
                title: Text(
                  TareaDatabase.getTareas().elementAt(index).descripcion,
                ),
                subtitle: Text(
                  TareaDatabase.getTareas()
                      .elementAt(index)
                      .prioridad
                      .name
                      .toUpperCase(),
                ),
                value: TareaDatabase.getTareas().elementAt(index).completada,
                onChanged: (value) {
                  setState(() {
                    TareaDatabase.toggleCompletada(
                      TareaDatabase.getTareas().elementAt(index),
                    );
                  });
                },
              ),
              Divider(color: Colors.white,),
            ],
          );
        },
        // La lista será de grande como tantas tareas haya
        itemCount: TareaDatabase.getTareas().length,
      ),
    );
  }
}
