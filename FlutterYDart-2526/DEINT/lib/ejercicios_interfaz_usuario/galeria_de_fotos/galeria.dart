import 'package:flutter/material.dart';

class Galeria extends StatefulWidget {
  const Galeria({super.key});

  @override
  State<Galeria> createState() => _GaleriaState();
}

class _GaleriaState extends State<Galeria> {
  // Creamos una lista de "fotos"
  final List<Image> imagenes = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Galería", style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            flex: 3,
            child: imagenes.isEmpty
                ? Container(
                    alignment: Alignment.center,
                    child: Text("No hay imágenes"),
                  )
                : GridView.builder(
                    // itemCount solo está disponible en el .builder
                    itemCount: imagenes.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisSpacing: 2,
                      crossAxisCount: 2,
                      childAspectRatio: 1
                    ),
                    itemBuilder: (context, index) {
                      return imagenes.elementAt(index);
                    },
                  ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      imagenes.add(
                        Image(
                          image: AssetImage(
                            "assets/images/imagen_de_imagen.jpg",
                          ),
                        ),
                      );
                    });
                  },
                  child: Text("+"),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      imagenes.removeLast();
                    });
                  },
                  child: Text("-"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
