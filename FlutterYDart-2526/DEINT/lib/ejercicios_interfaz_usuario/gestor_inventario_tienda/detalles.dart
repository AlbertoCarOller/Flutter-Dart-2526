import 'package:deint/ejercicios_interfaz_usuario/gestor_inventario_tienda/model/producto_data.dart';
import 'package:flutter/material.dart';

class Detalles extends StatefulWidget {
  const Detalles({super.key});

  @override
  State<Detalles> createState() => _DetallesState();
}

class _DetallesState extends State<Detalles> {
  // Creamos el controlador del scroll
  ScrollController sc = ScrollController();

  // Creamos un índice de usuario
  int indexUser = -1;

  // Guardamos los píxeles
  double pixelsComienzo = 0;

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
    // Traemos los argumentos
    List<dynamic> argumentos =
        ModalRoute.of(context)!.settings.arguments as List<dynamic>;
    // Guaramos los dos argumentos
    Producto producto = argumentos.elementAt(0);
    Function() funcion = argumentos.elementAt(1);
    // Creamos una lista temporal con listas de información del producto
    List<String> lista = [
      "Categoría: ${producto.categoria.name.toUpperCase()}",
      "Precio: ${producto.precio} EUR",
      "Stock: ${producto.stock}",
    ];
    return Scaffold(
      appBar: AppBar(title: Text("Detalles de ${producto.nombre}")),
      body: SingleChildScrollView(
        controller: sc,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Image.network(producto.urlImage, width: 250),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (String e in lista)
                  Expanded(
                    child: CardPersonalizada(
                      dato: e,
                      color: Colors.orange.shade700,
                    ),
                  ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Text("Etiquetas"),
            ),
            /* El Expanded es necesario porque estamos utilizando ListView que tiene
             su scroll y dentro de otros scrollables o como en este caso dentro de una
             Colum puede explotar porque no sabe el padre (Colum) que tamaño darle
             a su hijo (ListView) */
            /*Expanded(
              child:*/
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: ListView.builder(
                //Con shrinkWrap solo ocupa el espacio de sus hijos PERO pierde el srollable
                shrinkWrap: true,
                itemCount: producto.etiquetas.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onHorizontalDragStart: (details) {
                      pixelsComienzo = details.localPosition.dx;
                    },
                    onHorizontalDragUpdate: (details) {
                      if ((pixelsComienzo - details.localPosition.dx) > 150) {
                        // Actualizamso el index donde está ubicado el usuario
                        setState(() {
                          indexUser = index;
                        });
                      }
                    },
                    onHorizontalDragEnd: (details) {
                      if ((pixelsComienzo - details.localPosition.dx) > 150) {
                        setState(() {
                          InventarioDataBase.productos
                              .elementAt(
                                InventarioDataBase.obtenerIndex(producto),
                              )
                              .etiquetas
                              .removeAt(index);
                          indexUser = -1;
                        });
                      }
                    },
                    child: CardPersonalizada(
                      dato: producto.etiquetas.elementAt(index),
                      color: indexUser != index
                          ? Colors.grey.shade500
                          : Colors.red.shade300,
                    ),
                  );
                },
              ),
            ),
            /*),*/
            Padding(
              padding: EdgeInsetsGeometry.symmetric(vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    // Eliminamos el Stock del producto
                    onPressed: () {
                      setState(() {
                        InventarioDataBase.productos
                                .elementAt(
                                  InventarioDataBase.obtenerIndex(producto),
                                )
                                .stock =
                            0;
                        funcion();
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey.shade300,
                      foregroundColor: Colors.orange.shade900,
                    ),
                    child: Text("Eliminar Stock"),
                  ),
                  Row(
                    children: [
                      Text("En oferta"),
                      Switch(
                        activeThumbColor: Colors.orange.shade300,
                        inactiveThumbImage: AssetImage("/images/disco.png"),
                        activeThumbImage: AssetImage("/images/disco.png"),
                        value: InventarioDataBase.productos
                            .elementAt(
                              InventarioDataBase.obtenerIndex(producto),
                            )
                            .enOferta,
                        onChanged: (value) {
                          setState(() {
                            InventarioDataBase.productos
                                .elementAt(
                                  InventarioDataBase.obtenerIndex(producto),
                                )
                                .enOferta = !InventarioDataBase.productos
                                .elementAt(
                                  InventarioDataBase.obtenerIndex(producto),
                                )
                                .enOferta;
                          });
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Esta función va a permitir crear una card personalizada
class CardPersonalizada extends StatelessWidget {
  // Los datos a mostrar
  final String dato;

  // El color de la card
  final Color color;

  const CardPersonalizada({super.key, required this.dato, required this.color});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: color,
      child: Container(
        height: 100,
        alignment: Alignment.center,
        child: Text(
          dato,
          textAlign: TextAlign.center,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
        ),
      ),
    );
  }
}
