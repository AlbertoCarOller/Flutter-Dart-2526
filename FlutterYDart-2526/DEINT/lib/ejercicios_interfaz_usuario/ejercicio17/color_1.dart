import 'package:deint/ejercicios_interfaz_usuario/ejercicio17/grupo_colores.dart';
import 'package:flutter/material.dart';

class Color1 extends StatefulWidget {
  const Color1({super.key});

  @override
  State<Color1> createState() => _Color1State();
}

class _Color1State extends State<Color1> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade100,
      appBar: AppBar(
        title: Text("Color", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),
        centerTitle: true,
        backgroundColor: Colors.grey.shade500,
      ),
      body: Form(
        key: _formKey,
        child: Column(children: [
          for(MapEntry<String, bool> color in GrupoColores.activo.entries)
            CheckBoxPersonalizado(valorActual: color.value,
                subirValor: (newValue) => setState(() {
                  // Le cambiamos el valor
                  GrupoColores.activo[color.key] = newValue!;
                }),
                titulo: color.key),
          Container(
            padding: EdgeInsets.only(top: 90),
            child: ElevatedButton(onPressed: () {
              Navigator.pushNamed(context, "/color2");
            }, child: Text("GO")),
          )
        ]),
      ),
    );
  }
}

class CheckBoxPersonalizado extends StatelessWidget {
  final bool valorActual;
  final void Function(bool?)? subirValor;
  final String titulo;

  const CheckBoxPersonalizado({
    super.key,
    required this.valorActual,
    required this.subirValor,
    required this.titulo,
  });

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      value: valorActual,
      onChanged: (value) => subirValor!(value),
      title: Text(titulo),
    );
  }
}
