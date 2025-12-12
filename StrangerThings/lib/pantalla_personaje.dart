import 'package:flutter/material.dart';
import 'models/stranger_character.dart';

class PantallaPersonaje extends StatefulWidget {
  const PantallaPersonaje({super.key});

  @override
  State<PantallaPersonaje> createState() => _PantallaPersonajeState();
}

class _PantallaPersonajeState extends State<PantallaPersonaje> {
  // Creamos un scrollController, esto lo hacemos porque la pantalla va a ser scrollable (evitar overflow)
  ScrollController sc = ScrollController();

  // Creamos una variable que nos va a indicar si queremos la descripción corta o larga
  bool descripcionLarga = false;

  @override
  void initState() {
    super.initState();
    sc.addListener(() => print("${sc.position.pixels}"));
  }

  @override
  void dispose() {
    sc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Recuperamos al pesonaje de la pantalla anteior
    StrangerCharacter personaje =
        ModalRoute.of(context)!.settings.arguments as StrangerCharacter;
    return Scaffold(
      backgroundColor: ThemeUpside.upside ? Colors.black : Colors.white,
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              // Cambiamos al pulsar en el icono si se debe mostrar la bio larga o corta
              setState(() {
                descripcionLarga = !descripcionLarga;
              });
            },
            icon: Icon(descripcionLarga == false ? Icons.add : Icons.remove),
          ),
        ],
        title: Text(
          personaje.firstName,
          style: TextStyle(
            color: ThemeUpside.upside == true
                ? Colors.redAccent
                : Colors.black87,
          ),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          controller: sc,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "${personaje.firstName} ${personaje.lastName}",
                style: TextStyle(
                  fontSize: 30,
                  color: ThemeUpside.upside == true
                      ? Colors.redAccent
                      : Colors.black87,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: SizedBox(
                  height: 400,
                  width: 400,
                  child: Image.asset(
                    "lib/assets/images/characters/${personaje.gridImageUrl}",
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Row(
                  spacing: 8,
                  children: [
                    SizedBox(
                      width: 70,
                      child: Text(
                        "ESTADO",
                        style: TextStyle(
                          color: ThemeUpside.upside == true
                              ? Colors.redAccent
                              : Colors.black87,
                        ),
                      ),
                    ),
                    CircleAvatar(
                      backgroundColor: personaje.isAliveInSeason3 == true
                          ? Colors.green
                          : Colors.red,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5, left: 10),
                child: Row(
                  spacing: 8,
                  children: [
                    SizedBox(
                      width: 70,
                      child: Text(
                        "PODERES",
                        style: TextStyle(
                          color: ThemeUpside.upside == true
                              ? Colors.redAccent
                              : Colors.black87,
                        ),
                      ),
                    ),
                    CircleAvatar(
                      backgroundColor: personaje.hasPowers == true
                          ? Colors.red
                          : Colors.green,
                    ),
                  ],
                ),
              ),
              Divider(),
              Padding(
                padding: EdgeInsetsGeometry.symmetric(horizontal: 10),
                child: Text(
                  descripcionLarga == false
                      ? personaje.shortDescription
                      : personaje.longBio,
                  style: TextStyle(
                    color: ThemeUpside.upside == true
                        ? Colors.redAccent
                        : Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
    ;
  }
}
