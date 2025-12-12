import 'package:flutter/material.dart';
import 'package:hawkinlab/data/mock_data.dart';
import 'package:hawkinlab/models/stranger_character.dart';
import 'package:google_fonts/google_fonts.dart';

class LabScreen extends StatefulWidget {
  const LabScreen({super.key});

  @override
  State<LabScreen> createState() => _LabScreenState();
}

class _LabScreenState extends State<LabScreen> {
  // Creamos una varible que nos va a decir si filtramos por los que tienen poderes y si no todos
  bool soloPoderes = false;

  // Nos traemos la lista de caracteres pero filtrada por los que tienen poderes
  List<StrangerCharacter> listaConPoderes = charactersList
      .where((c) => c.hasPowers == true)
      .toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeUpside.upside ? Colors.black : Colors.white,
      appBar: AppBar(
        title: Text(
          "Hakins Lab",
          style: GoogleFonts.vt323(
            color: ThemeUpside.upside == true ? Colors.redAccent : Colors.black87,
          ),
        ),
        actions: [
          // Este botón va a controlar si mostrar los que tienen poderes o todos
          IconButton(
            color: ThemeUpside.upside == true ? Colors.redAccent : Colors.black87,
            onPressed: () {
              setState(() {
                soloPoderes = !soloPoderes;
              });
            },
            icon: Icon(
              soloPoderes == false ? Icons.filter_alt : Icons.filter_alt_off,
            ),
          ),
        ],
      ),
      // Aquí mostramos todos los personajes
      body: GridView.builder(
        itemCount: soloPoderes == false
            ? charactersList.length
            : listaConPoderes.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
        ),
        itemBuilder: (context, index) {
          return GestureDetector(
            // Al hacer doble click entramos en los detalles de un personaje
            onDoubleTap: () {
              Navigator.pushNamed(
                context,
                "/personaje",
                arguments: soloPoderes == false
                    ? charactersList.elementAt(index)
                    : listaConPoderes.elementAt(index),
              );
            },
            child: SizedBox(
              height: 200,
              width: 200,
              child: Card(
                color: Colors.grey.shade400,
                child: Stack(
                  children: [
                    Center(
                      child: Image.asset(
                        soloPoderes == false
                            ? "lib/assets/images/characters/${charactersList.elementAt(index).gridImageUrl}"
                            : "lib/assets/images/characters/${listaConPoderes.elementAt(index).gridImageUrl}",
                      ),
                    ),
                    // El nombre del personaje
                    Positioned(
                      bottom: 2,
                      left: 2,
                      right: 2,
                      child: Text(
                        textAlign: TextAlign.center,
                        soloPoderes == false
                            ? charactersList.elementAt(index).firstName
                            : listaConPoderes.elementAt(index).firstName,
                        style: GoogleFonts.vt323(
                          fontSize: 20,
                          color: ThemeUpside.upside == true ? Colors.redAccent
                          : Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    // Si tienen o no poderes (circle avatar)
                    Positioned(
                      right: 2,
                      child: CircleAvatar(
                        backgroundColor: soloPoderes == true
                            ? Colors.red
                            : charactersList.elementAt(index).hasPowers
                            ? Colors.red
                            : Colors.green,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
