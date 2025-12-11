import 'package:deint/ejercicios_interfaz_usuario/la_expedicion_perdida/modal/expedicion_data.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MochilaScreen extends StatefulWidget {
  const MochilaScreen({super.key});

  @override
  State<MochilaScreen> createState() => _MochilaScreenState();
}

class _MochilaScreenState extends State<MochilaScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          ElevatedButton(
            onPressed: TemploData.calcularPesoTotal() <= 10
                ? () {
                    Navigator.pushNamed(context, "/juego");
                  }
                : null,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.brown.shade200,
              foregroundColor: Colors.white,
            ),
            child: Text("Start"),
          ),
        ],
        title: Text(
          "Peso: ${TemploData.calcularPesoTotal()} Kg",
          style: GoogleFonts.dancingScript(
            color: TemploData.calcularPesoTotal() <= 10
                ? Colors.white
                : Colors.red.shade900,
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: TemploData.mochilaInicial.length,
        itemBuilder: (context, index) {
          return Dismissible(
            background: Container(
              color: Colors.red.shade400,
              child: Icon(Icons.delete),
            ),
            direction: DismissDirection.endToStart,
            onDismissed: (direction) {
              setState(() {
                TemploData.mochilaInicial.removeAt(index);
              });
            },
            key: Key(TemploData.mochilaInicial.elementAt(index).nombre),
            child: Card(
              color: Colors.brown.shade200,
              child: ListTile(
                title: Text(TemploData.mochilaInicial.elementAt(index).nombre),
                trailing: Text(
                  "${TemploData.mochilaInicial.elementAt(index).peso} kg",
                ),
                leading: Icon(Icons.backpack),
              ),
            ),
          );
        },
      ),
    );
  }
}
