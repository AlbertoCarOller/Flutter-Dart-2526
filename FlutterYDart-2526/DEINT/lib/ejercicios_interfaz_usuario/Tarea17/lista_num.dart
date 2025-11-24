import 'package:flutter/material.dart';

class ListaNum extends StatefulWidget {
  const ListaNum({super.key});

  @override
  State<ListaNum> createState() => _ListaNumState();
}

class _ListaNumState extends State<ListaNum> {
  List<int> listaNumeros = [1, 7, 12];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("List"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, "/num", arguments: cambiarEstado);
            },
            icon: Icon(Icons.arrow_right_outlined),
          ),
        ],
      ),
      body: ListView.separated(
        itemBuilder: (context, index) {
          return ListTile(title: Text("${listaNumeros[index]}"));
        },
        separatorBuilder: (context, index) {
          return Divider();
        },
        itemCount: listaNumeros.length,
      ),
    );
  }

  void cambiarEstado(int numCreado) {
    setState(() {
      listaNumeros.add(numCreado);
    });
  }
}
