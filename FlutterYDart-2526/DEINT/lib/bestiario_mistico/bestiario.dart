import 'package:deint/bestiario_mistico/bestiario_data.dart';
import 'package:flutter/material.dart';

class Bestiario extends StatefulWidget {
  const Bestiario({super.key});

  @override
  State<Bestiario> createState() => _BestiarioState();
}

class _BestiarioState extends State<Bestiario> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bestiario"),
        centerTitle: true,
        backgroundColor: Colors.blue,
        leading: Container(
          padding: EdgeInsets.all(10),
          child: FloatingActionButton(
            backgroundColor: Colors.tealAccent,
            onPressed: () async {
              await Navigator.pushNamed(context, "/crear");
              setState(() {});
            },
            child: Text("+"),
          ),
        ),
      ),
      body: GridView(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        children: BestiarioDataBase.getCriaturas()
            .map(
              (c) => Container(
                alignment: Alignment.center,
                color: Colors.cyan,
                child: Text(c.nombre, style: TextStyle(color: Colors.white)),
              ),
            )
            .toList(),
      ),
    );
  }
}