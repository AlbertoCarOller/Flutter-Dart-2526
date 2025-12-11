import 'package:deint/ejercicios_interfaz_usuario/smart_fridge/model/fridge_data.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NeveraScreen extends StatefulWidget {
  const NeveraScreen({super.key});

  @override
  State<NeveraScreen> createState() => _NeveraScreenState();
}

class _NeveraScreenState extends State<NeveraScreen> {
  // Creamos un scroll controller
  ScrollController sc = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Nevera"),
        // Da error porque el ScrollController no está conectado aún en este punto
        /*leading: Text(
          sc.position.pixels == sc.position.maxScrollExtent
              ? "Has llegado al final"
              : sc.position.pixels == sc.position.minScrollExtent
              ? "Estás al comienzo"
              : "",
          style: GoogleFonts.aboreto(color: Colors.white),
        ),*/
        actions: [
          /* Creamos un Theme para una parte concreta del código para dársela a un botón,
          * hacemos el copyWith cogemos como punto de partida nuestro propio theme */
          Theme(
            data: Theme.of(context).copyWith(
              elevatedButtonTheme: ElevatedButtonThemeData(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.teal.shade400,
                ),
              ),
            ),
            /* El nuevo contexto, todo lo que esté aquí dentro (todo lo que sea hijo de Theme)
            *  tendrá el theme de arriba */
            child: Builder(
              // El nuevo contexto
              builder: (newContext) {
                // El botón al que se le aplica el theme de arriba
                return ElevatedButton(
                  onPressed: () => Navigator.pushNamed(
                    context,
                    "/nuevo",
                    arguments: actualizarEstado,
                  ),
                  child: Text("Crear alimento"),
                );
              },
            ),
          ),
        ],
      ),
      body: ListView.builder(
        controller: sc,
        itemCount: Nevera.alimentos.length,
        itemBuilder: (context, index) {
          return Dismissible(
            // El fondo primario, en este caso el de comer
            background: Container(
              color: Colors.green.shade400,
              alignment: Alignment.center,
              child: Icon(Icons.flatware),
            ),
            // Fondo secundario en este caso el de eliminar/tirar la comida
            secondaryBackground: Container(
              alignment: Alignment.center,
              color: Colors.red.shade400,
              child: Icon(Icons.delete),
            ),
            onDismissed: (direction) {
              // Cuando nos comemos un alimento
              if (direction == DismissDirection.startToEnd) {
                setState(() {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      backgroundColor: Colors.green.shade400,
                      content: Text(
                        "Te has comido ${Nevera.alimentos.elementAt(index).nombre}",
                        style: GoogleFonts.outfit(color: Colors.white),
                      ),
                    ),
                  );
                  Nevera.alimentos.removeAt(index);
                });
              }
              // Cuando eliminamos un alimento
              if (direction == DismissDirection.endToStart) {
                setState(() {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      backgroundColor: Colors.red.shade400,
                      content: Text(
                        "Has desperdiciado ${Nevera.alimentos.elementAt(index).nombre}",
                        style: GoogleFonts.outfit(color: Colors.white),
                      ),
                    ),
                  );
                  Nevera.alimentos.removeAt(index);
                });
              }
            },
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
                        "Caduca en ${Nevera.alimentos.elementAt(index).diasParaCaducar} días",
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

  /// Esta función va a actualizar el estado de esta pantalla
  void actualizarEstado() {
    setState(() {});
  }
}
