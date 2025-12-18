import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart'
    as http; /* -> Importamos el http para conectarnos con APIs
 externas con el 'as' le ponemos una etiqueta al pquete que hemos traído para utilizar */

void main() {
  runApp(Principal2());
}

class Principal2 extends StatelessWidget {
  const Principal2({super.key});

  @override
  Widget build(BuildContext context) {
    // Creamos un tema predeterminado
    final ThemeData tema = ThemeData(
      textTheme: GoogleFonts.adventProTextTheme(),
      useMaterial3: true,
      appBarTheme: AppBarTheme(
        titleTextStyle: GoogleFonts.adventPro(
          fontWeight: FontWeight.bold,
          fontSize: 30,
        ),
        centerTitle: true,
        backgroundColor: Colors.red.shade500,
      ),
    );
    return MaterialApp(
      theme: tema,
      title: "Principal",
      home: ScreenLlamada2(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class ScreenLlamada2 extends StatefulWidget {
  const ScreenLlamada2({super.key});

  @override
  State<ScreenLlamada2> createState() => _ScreenLlamada2State();
}

class _ScreenLlamada2State extends State<ScreenLlamada2> {
  // Creamos el controlador de texto
  final _textNombre = TextEditingController();

  // Creamos el mapa que va a almacenar la información de un pokemon
  Map informacionPokemon = {};

  // Creamos la key del formulario
  final _formKey = GlobalKey<FormState>();

  // IMPORTANTE: en el initState no se pueden utilizar funciones asíncronas NUNCA
  @override
  void initState() {
    super.initState();
    _textNombre.addListener(() => print(_textNombre.text));
  }

  @override
  void dispose() {
    _textNombre.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Buscar pokémon",
          style: GoogleFonts.adventPro(
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
        ),
      ),
      body: Form(
        key: _formKey,
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.network(
                informacionPokemon.isEmpty
                    ? "https://static.vecteezy.com/system/resources/thumbnails/017/178"
                          "/409/small/red-cross-check-mark-on-transparent-background-free-png.png"
                    : (informacionPokemon['sprites'])['front_default'],
                height: 200,
                width: 200,
                fit: BoxFit.fill,
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 20, top: 20),
                child: Text(
                  informacionPokemon['name'] == null
                      ? "Nombre: No encontrado"
                      : "Nombre: ${informacionPokemon['name']}",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Text(
                  informacionPokemon['name'] == null
                      ? "Número de habilidades: No encontrado"
                      : "Número de Habilidades: ${(informacionPokemon['abilities']).length}",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  bottom: 20,
                  top: 50,
                  left: 50,
                  right: 50,
                ),
                child: SizedBox(
                  width: 150,
                  child: Card(
                    color: Colors.red.shade200,
                    child: TextFormField(
                      decoration: InputDecoration(border: InputBorder.none),
                      controller: _textNombre,
                      validator: (value) {
                        if (_textNombre.text.isEmpty) {
                          return "No se ha escrito nada";
                        }
                        return null;
                      },
                    ),
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    // Cargamos los datos antes del setState() porque o si no carga bien
                    informacionPokemon = await obtenerPokemon(_textNombre.text);
                    // Los setState() async {} -> Hacen 'la foto' al momento, no esperan
                    setState(() /*async*/ {});
                  }
                },
                child: Text("Buscar", style: TextStyle(color: Colors.red),),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Esta función, es una función 'Future' es decir que nos devolverá un mapa vacío si la petición
/// a la API de pokemon falla o un mapa con los datos del mismo en caso contrario, esto en un
/// futuro que no está claro (tiempo indeterminado), porque en hacer la petición puede tardar
Future<Map> obtenerPokemon(String nombre) async {
  // Hacemos una peticón a la API con URL de un pokemon
  http.Response response = await http.get(Uri.parse("https://pokeapi.co/api/v2/pokemon/$nombre"));
  return response.statusCode == 200 ? Map.of(jsonDecode(response.body)) : {};
}
