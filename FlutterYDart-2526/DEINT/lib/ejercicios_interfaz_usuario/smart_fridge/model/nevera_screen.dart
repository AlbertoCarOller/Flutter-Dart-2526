import 'package:deint/ejercicios_interfaz_usuario/smart_fridge/model/fridge_data.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NeveraScreen extends StatefulWidget {
  const NeveraScreen({super.key});

  @override
  State<NeveraScreen> createState() => _NeveraScreenState();
}

class _NeveraScreenState extends State<NeveraScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Nevera")),
      body: ListView.builder(
        itemCount: Nevera.alimentos.length,
        itemBuilder: (context, index) {
          return Dismissible(
            // Al dismissible hay que darle un key
            key: Key(Nevera.alimentos.elementAt(index).nombre),
            child: Card(
              color: Colors.teal.shade300,
              child: ListTile(
                title: Text(
                  Nevera.alimentos.elementAt(index).nombre,
                  style: GoogleFonts.outfit(),
                ),
                leading: CircleAvatar(
                  backgroundColor: Nevera.alimentos
                      .elementAt(index)
                      .categoria
                      .colorC,
                  child: Nevera.alimentos.elementAt(index).categoria.iconC,
                ),
                trailing: Nevera.alimentos.elementAt(index).diasParaCaducar < 3
                    ? Text(
                        "!CADUCA YA!",
                        style: GoogleFonts.outfit(
                          color: Colors.red.shade700,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    : Text(
                        "Caduca en ${Nevera.alimentos.elementAt(index).diasParaCaducar}",
                        style: GoogleFonts.outfit(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
              ),
            ),
          );
        },
      ),
    );
  }
}
