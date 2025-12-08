import 'package:deint/ejercicios_interfaz_usuario/cine/model/cine_data_base.dart';
import 'package:flutter/material.dart';

class CarteleraScreen extends StatefulWidget {
  const CarteleraScreen({super.key});

  @override
  State<CarteleraScreen> createState() => _CarteleraScreenState();
}

class _CarteleraScreenState extends State<CarteleraScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Cartelera")),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              // La dirección va a ser horizontal
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return GestureDetector();
              },
              // El número de películas del carrusel de estrenos son las que tengan estreno a true
              itemCount: Cartelera.peliculas
                  .where((p) => p.estreno == true)
                  .toList()
                  .length,
            ),
          ),
        ],
      ),
    );
  }
}
