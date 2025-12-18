import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart'
    as http; /* -> Importamos el http para conectarnos con APIs
 externas con el 'as' le ponemos una etiqueta al pquete que hemos traído para utilizar */

void main() {
  runApp(Principal());
}

class Principal extends StatelessWidget {
  const Principal({super.key});

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
        toolbarHeight: 120,
        centerTitle: true,
        backgroundColor: Colors.red.shade500,
      ),
    );
    return MaterialApp(
      theme: tema,
      title: "Principal",
      home: ScreenLlamada(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class ScreenLlamada extends StatefulWidget {
  const ScreenLlamada({super.key});

  @override
  State<ScreenLlamada> createState() => _ScreenLlamadaState();
}

class _ScreenLlamadaState extends State<ScreenLlamada> {
  /* Creamos una varible que va a ser la URL con la api de los pokemos que se
   terminará de completar con el pokemon que diga el usuario */
  String urlApi = "https://pokeapi.co/api/v2/pokemon/";

  // Creamos un mapa donde vamos a guardar toda la información del pokemon obtenido de la API
  Map informacionPokemon = {};

  // Creamos el textEditingController
  final _textNombre = TextEditingController();

  // Creamos el key del formulario
  final _formKey = GlobalKey<FormState>();

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
        actions: [
          Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 150,
                  child: Card(
                    color: Colors.white,
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
                // El botón es asíncrono porque no se queda bloqueado hasta quue nos devuelve el JSON la petición
                ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      // Parsemaos la URL completa con el nombre a un formato completamente correcto de URL
                      var parseURL = Uri.parse("$urlApi${_textNombre.text}");
                      // Enviámos la petición a al API para que nos devuelva el JSON con la información
                      http.Response response = await http.get(parseURL);
                      // Comprobamos si responde bien (200 OK)
                      if (response.statusCode == 200) {
                        setState(() {
                          // Transformamos el JSON que nos ha devuelto en un mapa
                          informacionPokemon = jsonDecode(response.body);
                        });
                      }
                    }
                  },
                  child: Text("Buscar", style: TextStyle(color: Colors.red)),
                ),
              ],
            ),
          ),
        ],
        title: Text("Buscar pokémon"),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.network(
              informacionPokemon.isEmpty
                  ? "https://static.vecteezy.com/system/resources/thumbnails/017/178/409/small/red-cross-check-mark-on-transparent-background-free-png.png"
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
              padding: const EdgeInsets.only(bottom: 20, top: 20),
              child: Text(
                informacionPokemon['name'] == null
                    ? "Número de habilidades: No encontrado"
                    : "Número de Habilidades: ${(informacionPokemon['abilities']).length}",
                style: TextStyle(fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
