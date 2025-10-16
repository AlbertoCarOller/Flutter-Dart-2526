import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(PruebaLayout());
}

class PruebaLayout extends StatelessWidget {
  const PruebaLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: "Layout", home: Layout());
  }
}

class Layout extends StatelessWidget {
  const Layout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.redAccent,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: Container(
                /* El widget padre le da el tamaño a su hijo, si no se pone una
                * propiedad restrictiva como el aligment */
                alignment: Alignment.center,
                height: 150,
                width: 150,
                color: Colors.grey,
                child: Container(height: 10, width: 10, color: Colors.black),
              ),
            ),
            Expanded(
              child: Container(
                /* Le damos el padding de 15, afecta a sí mismo, pero limita al stack,
                 porque el stack se intentará estirar hasta donde le permita el padre */
                padding: EdgeInsetsGeometry.all(15),
                height: 150,
                width: 150,
                color: Colors.white,
                /*child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Align(
                          alignment: Alignment.bottomLeft,
                          child: Container(
                            height: 10,
                            width: 10,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),*/
                /* El widget Stack admite children de widgets y permite la
                * superposición de widgets entre sí (sus hijos) */
                child: Stack(
                  children: [
                    /* IMPORTANTE, las caracteristicas de los padres van para los hijos
                    * hay otras como el color o margen que son autodescriptivas, pero cosas
                    * como la alineación o el padding van para los hijos, no para uno mismo */
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Container(
                        width: 10,
                        height: 10,
                        color: Colors.black,
                      ),
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: Container(
                        width: 10,
                        height: 10,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(15),
                color: Colors.grey,
                height: 150,
                width: 150,
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.topRight,
                      child: Container(
                        color: Colors.black,
                        height: 10,
                        width: 10,
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Container(
                        color: Colors.black,
                        height: 10,
                        width: 10,
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        color: Colors.black,
                        height: 10,
                        width: 10,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(15),
                width: 150,
                height: 150,
                color: Colors.white,
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.topRight,
                      child: Container(
                        color: Colors.black,
                        height: 10,
                        width: 10,
                      ),
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Container(
                        color: Colors.black,
                        height: 10,
                        width: 10,
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Container(
                        color: Colors.black,
                        height: 10,
                        width: 10,
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Container(
                        color: Colors.black,
                        height: 10,
                        width: 10,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(15),
                width: 150,
                height: 150,
                color: Colors.grey,
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.topRight,
                      child: Container(
                        color: Colors.black,
                        height: 10,
                        width: 10,
                      ),
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Container(
                        color: Colors.black,
                        height: 10,
                        width: 10,
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Container(
                        color: Colors.black,
                        height: 10,
                        width: 10,
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Container(
                        color: Colors.black,
                        height: 10,
                        width: 10,
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        color: Colors.black,
                        height: 10,
                        width: 10,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(15),
                width: 150,
                height: 150,
                color: Colors.white,
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.topRight,
                      child: Container(
                        color: Colors.black,
                        height: 10,
                        width: 10,
                      ),
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Container(
                        color: Colors.black,
                        height: 10,
                        width: 10,
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Container(
                        color: Colors.black,
                        height: 10,
                        width: 10,
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Container(
                        color: Colors.black,
                        height: 10,
                        width: 10,
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        color: Colors.black,
                        height: 10,
                        width: 10,
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                        color: Colors.black,
                        height: 10,
                        width: 10,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
