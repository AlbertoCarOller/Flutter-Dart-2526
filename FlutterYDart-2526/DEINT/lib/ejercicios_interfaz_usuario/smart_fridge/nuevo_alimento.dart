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

  // Creamos un textEditingController para manejar el TextFormField de la cantidad del alimento
  final _textControllerCantidad = TextEditingController();

  @override
  void initState() {
    super.initState();
    _textControllerName.addListener(() => print(_textControllerName.text));
    _textControllerCantidad.addListener(() => print(_textControllerName.text));
  }

  @override
  void dispose() {
    _textControllerName.dispose();
    _textControllerCantidad.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Traemos la función que va a actualizar el estado de la pantalla principal
    Function() funcion =
        ModalRoute.of(context)!.settings.arguments as Function();
    return Scaffold(
      appBar: AppBar(
        title: Text("Crear nuevo alimento"),
        actions: [
          Theme(
            data: Theme.of(context).copyWith(
              elevatedButtonTheme: ElevatedButtonThemeData(
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.teal.shade700,
                  backgroundColor: Colors.white,
                ),
              ),
            ),
            child: Builder(
              builder: (newContext) {
                return ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate() &&
                        indexCategoria != -1) {
                      // Creamos el alimento temporal que se guardará en caso de que no exista
                      Alimento alimentoTem = Alimento(
                        _textControllerName.text,
                        Categoria.values.elementAt(indexCategoria),
                        double.parse(_textControllerCantidad.text),
                        diasCaducidad,
                      );
                      // Guardamos el alimento en la lista, en caso de que no exista ya
                      if (!Nevera.alimentos.contains(alimentoTem)) {
                        Nevera.alimentos.add(alimentoTem);
                      }
                      Navigator.pop(context, funcion());
                    }
                  },
                  child: Text("Guardar"),
                );
              },
            ),
          ),
        ],
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsetsGeometry.only(right: 50, left: 50, top: 50),
              child: Card(
                color: Colors.teal.shade200,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "El nombre no es válido";
                      }
                      return null;
                    },
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
            TituloSeccion(text: "Cantidad"),
            Padding(
              padding: EdgeInsetsGeometry.symmetric(horizontal: 50),
              child: Card(
                color: Colors.teal.shade200,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: TextFormField(
                    validator: (value) {
                      try {
                        double precioTemp = double.parse(value!);
                        if (precioTemp <= 0) {
                          return "El precio no es válido";
                        }
                      } on FormatException {
                        return "No es un número";
                      }
                      return null;
                    },
                    keyboardType: TextInputType.number,
                    controller: _textControllerCantidad,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      label: Text(
                        "Cantidad (KG/L)",
                        style: GoogleFonts.outfit(),
                      ),
                    ),
                  ),
                ),
              ),
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
      padding: const EdgeInsets.only(top: 50),
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
