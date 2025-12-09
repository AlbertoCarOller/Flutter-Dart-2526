import 'package:deint/ejercicios_interfaz_usuario/cine/model/cine_data_base.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Detalles extends StatefulWidget {
  // La variable que representa la película, vamos a pasarlo desde las rutas directamente
  final Pelicula pelicula;

  const Detalles({super.key, required this.pelicula});

  @override
  State<Detalles> createState() => _DetallesState();
}

class _DetallesState extends State<Detalles> {
  ScrollController sc = ScrollController();

  // Grupo de valores para el formato
  Formato? grupoValores;

  @override
  void initState() {
    super.initState();
    sc.addListener(() => print("${sc.position.pixels}"));
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /* Accedemos a la variable película (pasada por parámetros) con widget.pelicula,
      * widget llama a la clase widget principal y como estamos en el State del mismo
      * no podemos acceder sin widget */
      appBar: AppBar(title: Text("Detalles de ${widget.pelicula.titulo}")),
      body: SingleChildScrollView(
        controller: sc,
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // El Hero receptor esta aquí
              Hero(
                tag: widget.pelicula.titulo,
                child: Image(
                  image: AssetImage(widget.pelicula.imagen),
                  height: 300,
                  width: 650,
                ),
              ),
              Text(
                widget.pelicula.titulo,
                style: GoogleFonts.acme(
                  fontWeight: FontWeight.bold,
                  fontSize: 35,
                ),
              ),
              Divider(color: Colors.black),
              Text("Formato", style: GoogleFonts.acme(
                fontWeight: FontWeight.bold,
                color: Colors.red.shade900
              ),),
              RadioGroup(
                groupValue: grupoValores,
                onChanged: (value) {
                  setState(() {
                    grupoValores = value;
                  });
                },
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: Formato.values.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(
                        Formato.values.elementAt(index).name.toUpperCase(),
                        style: GoogleFonts.acme(),
                      ),
                      trailing: Radio(value: Formato.values.elementAt(index)),
                    );
                  },
                ),
              ),
              ListView.builder(itemBuilder: (context, index) {
                return ListTile();
              },)
            ],
          ),
        ),
      ),
    );
  }
}
