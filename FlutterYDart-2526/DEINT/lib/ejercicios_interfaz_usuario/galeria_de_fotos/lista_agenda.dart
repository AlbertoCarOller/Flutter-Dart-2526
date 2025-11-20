import 'package:deint/ejercicios_interfaz_usuario/galeria_de_fotos/agenda_data_base.dart';
import 'package:flutter/material.dart';

class ListaAgenda extends StatefulWidget {
  const ListaAgenda({super.key});

  @override
  State<ListaAgenda> createState() => _ListaAgendaState();
}

class _ListaAgendaState extends State<ListaAgenda> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lista de contactos"),
        centerTitle: true,
        backgroundColor: Colors.yellow.shade100,
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: ListView.separated(
          itemBuilder: (context, index) {
            return Container(
              color: ElementoDataBase.elementos.elementAt(index).color,
              child: ListTile(
                trailing: IconButton(
                  onPressed: () {
                    setState(() {
                      ElementoDataBase.elementos.removeAt(index);
                    });
                  },
                  icon: Icon(Icons.restore_from_trash_outlined),
                ),
                focusColor: ElementoDataBase.elementos.elementAt(index).color,
                title: Text(ElementoDataBase.elementos.elementAt(index).nombre),
                subtitle: Text(
                  "${ElementoDataBase.elementos.elementAt(index).telefono}",
                ),
              ),
            );
          },
          separatorBuilder: (context, index) =>
              Divider(height: 30, color: Colors.orangeAccent.shade100),
          itemCount: ElementoDataBase.elementos.length,
        ),
      ),
    );
  }
}
