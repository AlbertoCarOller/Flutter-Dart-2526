import 'package:deint/ejercicios_interfaz_usuario/gestor_inventario_tienda/model/producto_data.dart';
import 'package:flutter/material.dart';

class InventarioScreen extends StatefulWidget {
  const InventarioScreen({super.key});

  @override
  State<InventarioScreen> createState() => _InventarioScreenState();
}

class _InventarioScreenState extends State<InventarioScreen> {
  // Creamos un scroll horizontal para las etiquetas de cada producto (Row que contiene la Card)
  final ScrollController sc = ScrollController();

  // Creamos el initState() y el dispose() que necesita el ScrollController
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
    return Scaffold(
      appBar: AppBar(
        title: Text("Inventario"),
        leading: IconButton(icon: Icon(Icons.filter_list), onPressed: () {}),
        actions: [
          Container(
            padding: EdgeInsets.only(right: 10),
            height: 40,
            width: 50,
            child: FloatingActionButton(
              backgroundColor: Colors.grey.shade600,
              foregroundColor: Colors.white,
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  "/nuevo",
                  arguments: reconstruirAlVolver,
                );
              },
              child: Text("+"),
            ),
          ),
        ],
      ),
      // Todos los productos del inventario
      body: GridView.builder(
        itemCount: InventarioDataBase.productos.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisSpacing: 2,
          mainAxisSpacing: 2,
          crossAxisCount: 2,
        ),
        itemBuilder: (context, index) {
          return GestureDetector(
            // Si se pulsa el producto se irá a la pantalla de detalles de ese producto
            onTap: () {
              Navigator.pushNamed(context, "/detalles",
                  arguments: [InventarioDataBase.productos.elementAt(index), reconstruirAlVolver]);
            },
            // Si se pulsa de forma continua el producto aparecerá un SnackBar
            onLongPress: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  duration: Duration(seconds: 3),
                  action: SnackBarAction(label: "Cerrar", textColor: Colors.grey.shade700, onPressed: () {}),
                  backgroundColor: Colors.orange.shade700,
                  content: Text(
                    "Producto: ${InventarioDataBase.productos.elementAt(index).nombre}",
                  ),
                ),
              );
            },
            child: Card(
              color: InventarioDataBase.productos.elementAt(index).stock < 5
                  ? Colors.red.shade300
                  : Colors.grey.shade400,
              child: Stack(
                children: [
                  Positioned(
                    right: 5,
                    left: 5,
                    top: 5,
                    child: Text(
                      textAlign: TextAlign.center,
                      InventarioDataBase.productos.elementAt(index).nombre,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Positioned(
                    right: 5,
                    left: 5,
                    top: 40,
                    bottom: 40,
                    child: Image.network(
                      InventarioDataBase.productos.elementAt(index).urlImage,
                    ),
                  ),
                  Positioned(
                    right: 5,
                    left: 5,
                    bottom: 5,
                    child: Text(
                      textAlign: TextAlign.center,
                      InventarioDataBase.productos
                          .elementAt(index)
                          .categoria
                          .name
                          .toUpperCase(),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  /// Esta función va a reconstruir el builder
  /// al volver de la pantalla '/nuevo'
  void reconstruirAlVolver() {
    setState(() {});
  }
}
