import 'package:deint/ejercicios_interfaz_usuario/cine/model/cine_data_base.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CarteleraScreen extends StatefulWidget {
  const CarteleraScreen({super.key});

  @override
  State<CarteleraScreen> createState() => _CarteleraScreenState();
}

class _CarteleraScreenState extends State<CarteleraScreen> {
  // Guardamos en una lista las películas que están de estreno
  List<Pelicula> estrenos = Cartelera.peliculas
      .where((p) => p.estreno == true)
      .toList();

  // Guardamos en una lista las películas que no están de estreno
  List<Pelicula> noEstrenos = Cartelera.peliculas
      .where((p) => p.estreno == false)
      .toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Cartelera")),
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              color: Colors.grey.shade500,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Text(
                      "Estrenos",
                      style: GoogleFonts.acme(
                        fontWeight: FontWeight.bold,
                        color: Colors.red.shade900,
                      ),
                    ),
                  ),
                  Divider(color: Colors.black),
                  Expanded(
                    child: ListView.builder(
                      // La dirección va a ser horizontal
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            Text(
                              estrenos.elementAt(index).titulo,
                              style: GoogleFonts.acme(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(
                                  context,
                                  "/detalles",
                                  arguments: estrenos.elementAt(index),
                                );
                              },
                              /* El Hero va crear una animación, va a volar hasta
                               el Hero destino que tenga el mismo tag */
                              child: Hero(
                                tag: estrenos.elementAt(index).titulo,
                                child: Image(
                                  image: AssetImage(
                                    estrenos.elementAt(index).imagen,
                                  ),
                                  width: 200,
                                  height: 300,
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                      // El número de películas del carrusel de estrenos son las que tengan estreno a true
                      itemCount: estrenos.length,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.grey.shade300,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Text(
                      "En cartelera",
                      style: GoogleFonts.acme(
                        fontWeight: FontWeight.bold,
                        color: Colors.red.shade900,
                      ),
                    ),
                  ),
                  Divider(color: Colors.black),
                  Expanded(
                    child: ListView.builder(
                      itemCount: noEstrenos.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              "/detalles",
                              arguments: noEstrenos.elementAt(index),
                            );
                          },
                          child: Row(
                            children: [
                              Hero(
                                tag: noEstrenos.elementAt(index).titulo,
                                child: Image(
                                  image: AssetImage(
                                    noEstrenos.elementAt(index).imagen,
                                  ),
                                  width: 100,
                                  height: 200,
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  noEstrenos.elementAt(index).titulo,
                                  style: GoogleFonts.acme(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
