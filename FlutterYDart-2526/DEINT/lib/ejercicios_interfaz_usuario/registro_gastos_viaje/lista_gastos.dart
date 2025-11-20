import 'package:deint/ejercicios_interfaz_usuario/registro_gastos_viaje/gasto_data_base.dart';
import 'package:flutter/material.dart';

class ListaGastos extends StatefulWidget {
  const ListaGastos({super.key});

  @override
  State<ListaGastos> createState() => _ListaGastosState();
}

class _ListaGastosState extends State<ListaGastos> {
  final _scrollState = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lista de gastos"),
        centerTitle: true,
        backgroundColor: Colors.green.shade200,
      ),
      body: ListView.separated(
        itemCount: GastoDataBase.gastos.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsetsGeometry.all(10),
            child: Container(
              color: Colors.green.shade100,
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: ListTile(
                title: Text(GastoDataBase.gastos.elementAt(index).concepto),
                subtitle: Text(
                  "${GastoDataBase.gastos.elementAt(index).concepto} EUR",
                ),
                leading:
                    GastoDataBase.categoriasDisponibles[GastoDataBase.gastos
                        .elementAt(index)
                        .categoria],
                trailing: IconButton(
                  onPressed: () {
                    setState(() {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          duration: Duration(seconds: 2),
                          backgroundColor: Colors.green,
                          content: Text(
                            "Se ha eliminado correctamente"
                            " '${GastoDataBase.gastos.elementAt(index).concepto}'",
                          ),
                        ),
                      );
                      GastoDataBase.gastos.removeAt(index);
                    });
                  },
                  icon: Icon(Icons.delete),
                ),
              ),
            ),
          );
        },
        separatorBuilder: (context, index) {
          return SizedBox.shrink();
        },
      ),
    );
  }
}
