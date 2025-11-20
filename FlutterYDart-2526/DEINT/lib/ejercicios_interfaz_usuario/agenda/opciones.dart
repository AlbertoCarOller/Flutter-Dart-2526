import 'package:flutter/material.dart';

class Opciones extends StatelessWidget {
  const Opciones({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Agenda"), centerTitle: true, backgroundColor: Colors.yellow.shade100,),
      body: ListView.separated(
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(index == 0 ? "Ver agenda" : "Crear elemento"),
            trailing: IconButton(
              onPressed: () {
                index == 0
                    ? Navigator.pushNamed(context, "/agenda")
                    : Navigator.pushNamed(context, "/crear");
              },
              icon: Icon(Icons.arrow_right_outlined),
            ),
          );
        },
        separatorBuilder: (context, index) => Divider(),
        itemCount: 2,
      ),
    );
  }
}
