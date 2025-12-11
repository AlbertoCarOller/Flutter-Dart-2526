import 'package:deint/ejercicios_interfaz_usuario/smart_fridge/model/fridge_data.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NuevoAlimento extends StatefulWidget {
  const NuevoAlimento({super.key});

  @override
  State<NuevoAlimento> createState() => _NuevoAlimentoState();
}

class _NuevoAlimentoState extends State<NuevoAlimento> {
  // Creamos la key del formulario
  final _formKey = GlobalKey<FormState>();

  // Creamos el controlador del TextFormField del nombre del alimento
  final _textControllerName = TextEditingController();

  // Guardamos el índice de la categoría seleccionada
  int indexCategoria = -1;

  // Guardamos los días de caducidad del alimento que estamos creando
  int diasCaducidad = 1;

  @override
  void initState() {
    super.initState();
    _textControllerName.addListener(() => print(_textControllerName.text));
  }

  @override
  void dispose() {
    _textControllerName.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Crear nuevo alimento")),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsetsGeometry.symmetric(
                horizontal: 50,
                vertical: 10,
              ),
              child: Card(
                color: Colors.teal.shade200,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: TextFormField(
                    controller: _textControllerName,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      label: Text(
                        "Nombre alimento",
                        style: GoogleFonts.outfit(),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            TituloSeccion(text: "Categoría"),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                for (int i = 0; i < Categoria.values.length; i++)
                  GestureDetector(
                    onTap: () {
                      if (indexCategoria == -1) {
                        setState(() {
                          indexCategoria = i;
                        });
                      }
                    },
                    onLongPress: () {
                      if (indexCategoria == i) {
                        setState(() {
                          indexCategoria = -1;
                        });
                      }
                    },
                    child: CircleAvatar(
                      radius: 50,
                      backgroundColor: i != indexCategoria
                          ? Categoria.values.elementAt(i).colorC
                          : Colors.tealAccent.shade700,
                      child: Categoria.values.elementAt(i).iconC,
                    ),
                  ),
              ],
            ),
            TituloSeccion(text: "Días para caducar"),
            Slider(
              activeColor: diasCaducidad >= 1 && diasCaducidad <= 5
                  ? Colors.red
                  : diasCaducidad >= 6 && diasCaducidad <= 10
                  ? Colors.orange
                  : Colors.green,
              label: "$diasCaducidad",
              min: 1,
              max: 15,
              divisions: 15,
              value: diasCaducidad.toDouble(),
              onChanged: (value) {
                setState(() {
                  diasCaducidad = value.round();
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}

/// Esta función va a permitir crear una sección, con un divider, un tútulo
/// y un padding, para así diferenciar unas secciones de otras
class TituloSeccion extends StatelessWidget {
  final String text;

  const TituloSeccion({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Column(
        children: [
          Divider(color: Colors.black),
          Text(
            text,
            style: GoogleFonts.outfit(
              color: Colors.teal.shade900,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
