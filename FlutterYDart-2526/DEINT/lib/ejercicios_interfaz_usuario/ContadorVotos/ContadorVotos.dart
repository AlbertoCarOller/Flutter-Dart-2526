import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(ContadorDeVotos());
}

class ContadorDeVotos extends StatelessWidget {
  const ContadorDeVotos({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: "ContadorDeVotos", home: ContarVotos());
  }
}

class ContarVotos extends StatefulWidget {
  const ContarVotos({super.key});

  @override
  State<ContarVotos> createState() => _ContarVotosState();
}

class _ContarVotosState extends State<ContarVotos> {
  // Creamos los contadores
  int contadorA = 0;
  int contadorB = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Votos"),
        backgroundColor: Colors.blueAccent,
      ),
      // SizedBox tiene la misma funcionalidad que un container
      body: Center(
        child: SizedBox(
          width: 550,
          height: 550,
          child: Row(
            children: [
              /* El Expanded es fundamental, ponemos el siguiente contexto: tenemos
            * dos imágenes dentro de un Colum o Row, aunque estas tengan un tamaño
            * limitado por el Container o en este caso el SizedBox las imágenes son
            * las que dictan el tamaño que quieren, esto puede porvocar overflow
            * al pedir más píxeles de lo que el Colum/Row puede ofrecer, se soluciona
            * con Expanded, este obliga a los hijos a adaptarse al espacio que hay,
            * no el espacio que los hijos quieran, si no el disponible */
              Expanded(
                /* Flex determina el tamaño (dentro de las posibilidades) de cada
              * Expanded, en este caso hay dos flex, 1 + 1 = 2, los dos tendrán
              * el mismo tamño, si hay 3 flex, es decir 1 + 2, el que tiene 2 de
              * flex ocupará más espacio que el otro */
                flex: 1,
                /* Creamos una columna para pone en una misma columa, la imagen,
                 el botón y el contador */
                child: Column(
                  children: [
                    Text("Votos Spain: $contadorA"),
                    Image.network(
                      "https://images.pexels.com/photos/919111/pexels-photo-919111.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
                    ),
                    // Creamos un botón que al pulsar suma el contador a
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          contadorA++;
                        });
                      },
                      child: Icon(Icons.add),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  children: [
                    Text("Votos Canada: $contadorB"),
                    Image.network(
                      "https://globalnews.ca/wp-content/uploads/2025/02/IMG_6954.jpg?quality=65&strip=all",
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          contadorB++;
                        });
                      },
                      child: Icon(Icons.add),
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
