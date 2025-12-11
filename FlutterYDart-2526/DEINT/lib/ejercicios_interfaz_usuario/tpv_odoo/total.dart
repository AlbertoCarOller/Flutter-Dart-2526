import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'model/tpv_data.dart';

class Total extends StatefulWidget {
  const Total({super.key});

  @override
  State<Total> createState() => _TotalState();
}

class _TotalState extends State<Total> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Total")),
      body: Column(
        children: [
          Expanded(
            flex: 3,
            child: ListView.builder(
              itemCount: TPVData.productosSeleccionados.length,
              itemBuilder: (context, index) {
                return Dismissible(
                  direction: DismissDirection.startToEnd,
                  onDismissed: (direction) {
                    if (direction == DismissDirection.startToEnd) {
                      setState(() {
                        TPVData.eliminarTodasCantidades();
                        TPVData.productosSeleccionados.clear();
                      });
                    }
                  },
                  key: Key(
                    TPVData.productosSeleccionados.elementAt(index).nombre,
                  ),
                  child: ListTile(
                    title: Text(
                      TPVData.productosSeleccionados.elementAt(index).nombre,
                    ),
                    trailing: Text(
                      "${TPVData.productosSeleccionados.elementAt(index).precio}€",
                    ),
                    leading: Text(
                      "x${TPVData.productosSeleccionados.elementAt(index).cantidad}",
                    ),
                  ),
                );
              },
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Total:", style: GoogleFonts.aboreto(fontSize: 30)),
                Container(
                  alignment: Alignment.center,
                  height: 160,
                  width: 300,
                  decoration: BoxDecoration(
                    border: BoxBorder.all(color: Colors.black),
                  ),
                  child: Text(
                    "${TPVData.calcularPrecioTotal()}€",
                    style: GoogleFonts.aboreto(fontSize: 30),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
