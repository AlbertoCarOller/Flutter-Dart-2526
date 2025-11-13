import 'package:flutter/material.dart';

class End extends StatelessWidget {
  const End({super.key});

  @override
  Widget build(BuildContext context) {
    // Obtenemos una lista con toda la información necesaria
    List<String> listaRecursos =
    ModalRoute
        .of(context)!
        .settings
        .arguments as List<String>;
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 100,
          backgroundColor: Colors.teal,
          foregroundColor: Colors.white,
          title: Text("Sharing opportunities"),
          centerTitle: true,
        ),
        body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                for (String i in listaRecursos)
                  Text(i, style: TextStyle(fontSize: 20)),
              ],
            ),
        )
    );
  }
}
