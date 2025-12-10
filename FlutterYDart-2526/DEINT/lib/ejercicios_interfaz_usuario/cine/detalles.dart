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

  // Guardamos el índice seleccionado por el usuario (horario)
  int indexHorario = -1;

  // Creamos una lista de extras
  Map<List<dynamic>, bool> extras = {
    ["Añadir Palomitas", 3]: false,
    ["Añadir Refresco", 2]: false,
  };

  // Creamos una lista con los títulos de cada sección
  List<String> titulosSeccion = [
    "Formato",
    "Horario",
    "Extras",
    "Pasos finales",
  ];

  // Creamos una variable donde guardar el precio final
  late double precioFinal;

  // Creamos una nueva varible que va a ser el último formato elegido por el usuario
  Formato? ultimoFormatoElegido;

  @override
  void initState() {
    super.initState();
    sc.addListener(() => print("${sc.position.pixels}"));
    // Iniciamos el valor de comienzo de la varible 'precioFinal'
    precioFinal = widget.pelicula.precioBase;
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
              TituloSeccion(text: titulosSeccion.elementAt(0)),
              RadioGroup(
                groupValue: grupoValores,
                onChanged: (value) {
                  setState(() {
                    grupoValores = value;
                    // Comprobamos que el último formato no sea null y que sea distinto al elegido
                    if (ultimoFormatoElegido != null &&
                        ultimoFormatoElegido != grupoValores) {
                      // Primero restamos el precio del último para volver al precio antes de elegir formato
                      precioFinal -= ultimoFormatoElegido!.precioExtra;
                      // Le sumamos el nuevo formato elegido
                      precioFinal += grupoValores!.precioExtra;
                    } else {
                      precioFinal += grupoValores!.precioExtra;
                    }
                    // Le damos el último valor tras las comparaciones a nuestra variable 'ultimoFormatoElegido'
                    ultimoFormatoElegido = grupoValores;
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
              TituloSeccion(text: titulosSeccion.elementAt(1)),
              ListView.builder(
                shrinkWrap: true,
                itemCount: widget.pelicula.horarios.length,
                itemBuilder: (context, index) {
                  return Card(
                    color: indexHorario != index
                        ? Colors.grey.shade300
                        : Colors.green.shade300,
                    child: ListTile(
                      title: Text(
                        widget.pelicula.horarios.elementAt(index),
                        style: GoogleFonts.acme(),
                      ),
                      trailing: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            indexHorario = index;
                          });
                        },
                        onLongPress: () {
                          if (indexHorario == index) {
                            setState(() {
                              indexHorario = -1;
                            });
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey.shade500,
                          foregroundColor: Colors.red.shade900,
                        ),
                        child: Text("Seleccionar"),
                      ),
                    ),
                  );
                },
              ),
              TituloSeccion(text: titulosSeccion.elementAt(2)),
              ListView.builder(
                shrinkWrap: true,
                itemCount: extras.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(
                      "${extras.entries.elementAt(index).key.elementAt(0)}"
                      " (${extras.entries.elementAt(index).key.elementAt(1)}€)",
                      style: GoogleFonts.acme(),
                    ),
                    trailing: Checkbox(
                      value: extras.entries.elementAt(index).value,
                      onChanged: (value) {
                        setState(() {
                          extras[extras.entries.elementAt(index).key] = value!;
                          // Sumamos al precio final
                          if (value && index == 0) {
                            precioFinal += 3;
                          }
                          if (value && index == 1) {
                            precioFinal += 2;
                          }
                          if (!value &&
                              widget.pelicula.precioBase != precioFinal) {
                            if (index == 0) {
                              precioFinal -= 3;
                            }
                            if (index == 1) {
                              precioFinal -= 2;
                            }
                          }
                        });
                      },
                    ),
                  );
                },
              ),
              TituloSeccion(text: titulosSeccion.elementAt(3)),
              Padding(
                padding: const EdgeInsets.only(bottom: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Precio final: $precioFinal€",
                      style: GoogleFonts.acme(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey.shade500,
                        foregroundColor: Colors.red.shade900,
                      ),
                      onPressed: indexHorario != -1 && grupoValores != null
                          ? () {
                              Navigator.pushNamed(
                                context,
                                "/asientos",
                                arguments: widget.pelicula,
                              );
                            }
                          : null,
                      child: Text("Elegir asiento"),
                    ),
                  ],
                ),
              ),
            ],
          ),
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
            style: GoogleFonts.acme(
              color: Colors.red.shade900,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
