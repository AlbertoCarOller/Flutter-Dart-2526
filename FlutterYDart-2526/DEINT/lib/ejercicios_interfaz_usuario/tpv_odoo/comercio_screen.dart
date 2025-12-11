import 'package:deint/ejercicios_interfaz_usuario/tpv_odoo/model/tpv_data.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ComercioScreen extends StatefulWidget {
  const ComercioScreen({super.key});

  @override
  State<ComercioScreen> createState() => _ComercioScreenState();
}

class _ComercioScreenState extends State<ComercioScreen> {
  // Creamos una varible que va a acumular el precio total de los productos seleccionados
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("TPV Comercio")),
      body: Column(
        children: [
          Expanded(
            child: GridView.builder(
              itemCount: TPVData.productos.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
              ),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onDoubleTap: () {
                    if (TPVData.productosSeleccionados.contains(
                      TPVData.productos.elementAt(index),
                    )) {
                      setState(() {
                        int indexBorrado = TPVData.productosSeleccionados
                            .indexOf(TPVData.productos.elementAt(index));
                        TPVData.eliminarCantidad(indexBorrado);
                        TPVData.productosSeleccionados.removeAt(indexBorrado);
                      });
                    }
                  },
                  onTap: () {
                    setState(() {
                      if (TPVData.productosSeleccionados.contains(
                        TPVData.productos.elementAt(index),
                      )) {
                        int indexProducto = TPVData.productosSeleccionados
                            .indexOf(TPVData.productos.elementAt(index));
                        TPVData.productosSeleccionados
                            .elementAt(indexProducto)
                            .cantidad++;
                      } else {
                        TPVData.productosSeleccionados.add(
                          TPVData.productos.elementAt(index),
                        );
                        int indexProducto = TPVData.productosSeleccionados
                            .indexOf(TPVData.productos.elementAt(index));
                        TPVData.productosSeleccionados
                            .elementAt(indexProducto)
                            .cantidad++;
                      }
                    });
                  },
                  child: Card(
                    color: Colors.grey.shade400,
                    child: Image(
                      image: NetworkImage(
                        scale: 5,
                        TPVData.productos.elementAt(index).imagen,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Expanded(
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
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, "/total");
            },
            child: Container(
              height: 30,
              width: double.infinity,
              alignment: Alignment.center,
              child: Text("Terminar", style: GoogleFonts.aboreto(fontSize: 20),),
            ),
          )
        ],
      ),
    );
  }
}
