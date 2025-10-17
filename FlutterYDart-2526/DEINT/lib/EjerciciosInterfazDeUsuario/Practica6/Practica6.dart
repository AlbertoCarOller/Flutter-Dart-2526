import 'package:flutter/material.dart';

void main() {
  runApp(ProfileUI());
}

class ProfileUI extends StatelessWidget {
  const ProfileUI({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: "Profile UI", home: ProfileScreen());
  }
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Columna principal (cuerpo)
      body: Column(
        children: [
          // Header
          Expanded(
            // Primera fila
            child: Row(
              // stretch -> estira los elementos
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Imagen perro
                Container(
                  color: Colors.blue.shade100,
                  child: Image(
                    image: NetworkImage("https://picsum.photos/id/237/200/200"),
                    width: 80,
                    fit: BoxFit.cover,
                  ),
                ),
                // info usuario amarillo
                Expanded(
                  flex: 4,
                  child: Container(
                    color: Colors.yellow.shade300,
                    alignment: Alignment.center,
                    child: Text("info del usuario"),
                  ),
                ),
              ],
            ),
          ),
          // Imagen central
          Expanded(
            flex: 3,
            child: Image.network(
              "https://picsum.photos/seed/flutter/600/400",
              // BoxFit.cover -> Adapta la imagen al espacio sin deformarla
              fit: BoxFit.cover,
            ),
          ),
          // Footer
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    color: Colors.red.shade300,
                    child: Center(child: Text("Botón 1")),
                  ),
                ),
                Expanded(
                  child: Container(
                    color: Colors.green.shade300,
                    child: Center(child: Text("Botón 2")),
                  ),
                ),
                Expanded(
                  child: Container(
                    color: Colors.purple.shade300,
                    child: Center(child: Text("Botón 3")),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
