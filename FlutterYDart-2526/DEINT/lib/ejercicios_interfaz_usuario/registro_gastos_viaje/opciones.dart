import 'package:flutter/material.dart';

class Opciones extends StatefulWidget {
  const Opciones({super.key});

  @override
  State<Opciones> createState() => _OpcionesState();
}

class _OpcionesState extends State<Opciones> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Opciones"),
        centerTitle: true,
        backgroundColor: Colors.green.shade200,
      ),
      body: ListView.separated(
        itemBuilder: (context, index) {
          return ListTile(
            trailing: IconButton(
              onPressed: () {
                index == 0
                    ? Navigator.pushNamed(context, "/crear")
                    : Navigator.pushNamed(context, "/gastos");
              },
              icon: Icon(Icons.navigate_next_outlined),
            ),
            title: Text(
              index == 0 ? "Añadir un nuevo gasto" : "Ver lista de gastos",
            ),
          );
        },
        separatorBuilder: (context, index) {
          return Divider(height: 10, color: Colors.green.shade200);
        },
        itemCount: 2,
      ),
    );
  }
}
