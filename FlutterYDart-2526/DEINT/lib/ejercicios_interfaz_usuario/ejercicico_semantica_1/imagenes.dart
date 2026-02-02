import 'package:flutter/material.dart';

class Imagenes extends StatefulWidget {
  const Imagenes({super.key});

  @override
  State<Imagenes> createState() => _ImagenesState();
}

class _ImagenesState extends State<Imagenes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Imágenes")),
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                crossAxisCount: 2,
              ),
              itemBuilder: (context, index) {
                // Semantics envuelvo la imagen en este para que diga lo escrito en el label
                return Semantics(
                  label: index == 0
                      ? "Bosque con grandes árboles"
                      : index == 1
                      ? "Playa paradisiaca"
                      : index == 2
                      ? "Gozilla escupiendo"
                      : "El planeta tierra",
                  child: Image.asset(
                    index == 0
                        ? "assets/images/bosque.jpeg"
                        : index == 1
                        ? "assets/images/playa.jpg"
                        : index == 2
                        ? "assets/images/Godzilla.png"
                        : "assets/images/earth.png",
                  ),
                );
              },
              itemCount: 4,
            ),
          ),
          Expanded(
            child: Container(
              alignment: Alignment.center,
              child: Semantics(
                label: "Siguiente pantalla",
                // Para excluir el Text de abajo y que diga el del label
                excludeSemantics: true,
                child: TextButton(
                  onPressed: () => print("Pulsado"),
                  child: Text("Siguiente"),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
