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
            onPressed: () {
              Navigator.pushNamed(context, "/crear", arguments: reloadBeasts);
            },
            child: Text("+"),
          ),
        ),
      ),
      body: GridView(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisSpacing: 2,
          crossAxisSpacing: 2,
          crossAxisCount: 2,
        ),
        children: BestiarioDataBase.getCriaturas()
            .map(
              (c) => Container(
                alignment: Alignment.center,
                color: Colors.cyan,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(c.nombre, style: TextStyle(color: Colors.white)),
                    Text("Nivel de peligro ${c.nivelPeligro}"),
                    Text("Alineamiento: ${c.alineamiento.name.toUpperCase()}"),
                    c.esHostil
                        ? Icon(Icons.warning_amber_sharp)
                        : Icon(Icons.gpp_good),
                  ],
                ),
              ),
            )
            .toList(),
      ),
    );
  }

  /// Esta función reconstruye el build de esta página,
  /// la utilizaremos para en vez de utilizar el 'Future' podamos
  /// recargar la página una vez guarde una bestia
  void reloadBeasts() {
    setState(() {
      print("Loading new beasts ........... ");
    });
  }
}
