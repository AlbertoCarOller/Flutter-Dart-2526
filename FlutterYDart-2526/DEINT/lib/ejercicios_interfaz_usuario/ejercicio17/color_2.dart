import 'package:deint/ejercicios_interfaz_usuario/ejercicio17/grupo_colores.dart';
import 'package:flutter/material.dart';

class Color2 extends StatefulWidget {
  const Color2({super.key});

  @override
  State<Color2> createState() => _Color2State();
}

class _Color2State extends State<Color2> {
  final _formKey = GlobalKey<FormState>();

  // Los valores de colores activos
  Color _grupoColores =
      (GrupoColores.colores.entries
          //Filtramos por los colores que están activos
          .where((c) => GrupoColores.activo[c.key] == true)

          /* Extraemos los valores de los colores y seleccionamos uno, en caso de que
       no haya colores activos, seleccionamos trasparent, un group values necesita que
       uno siempre esté seleccionado*/
          .map((c) => c.value)
          .firstOrNull) ??
      Colors.transparent;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Color",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
        ),
        centerTitle: true,
        backgroundColor: Colors.grey.shade500,
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            RadioGroup(
              groupValue: _grupoColores,
              onChanged: (value) => setState(() {
                _grupoColores = value!;
              }),
              child: Column(
                children: [
                  for (MapEntry<String, Color> colores
                      in GrupoColores.colores.entries
                      // Utilizamos el where para filtrar los colores que están activos
                      .where((c) => GrupoColores.activo[c.key] == true))
                    RadioPersonalizado(
                      valorActual: colores.value,
                      texto: colores.key,
                    ),
                  SizedBox(height: 90),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, "/final",
                        arguments: _grupoColores);
                      },
                      child: Text("GO"),
                    ),
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

/// Esta función va a generar los RadioButtons personalizados
class RadioPersonalizado extends StatelessWidget {
  final Color valorActual;
  final String texto;

  const RadioPersonalizado({
    super.key,
    required this.valorActual,
    required this.texto,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(texto),
      trailing: Radio<Color>(value: valorActual),
    );
  }
}
