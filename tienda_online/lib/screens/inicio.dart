import 'package:flutter/material.dart';

class Inicio extends StatefulWidget {
  const Inicio({super.key});

  @override
  State<Inicio> createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Un Stack para poner de fondo una imagen
      body: Stack(
        children: [
          // Le ponemos una opacidad del 30% a la imagen
          Opacity(
            opacity: 0.3,
            child: Image.asset(
              "assets/images/fondoKivon.png",
              // Le ponemos cover para que la imagen cubra toda la pantalla sin deformarse
              fit: BoxFit.cover,
              // Para que cubra toda la pantalla
              width: double.infinity,
              height: double.infinity,
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("assets/images/logoKivoCompleto.png", scale: 2),
                Column(
                  children: [
                    // Botón de inicio de sesión
                    Padding(
                      padding: const EdgeInsets.only(bottom: 6),
                      child: Container(
                        decoration: BoxDecoration(
                          // Ponemos los bordes de forma más circular
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          // El gradient es un atributo para combinar mediante degradado dos o más colores
                          gradient: LinearGradient(
                            // Donde empieza el color
                            begin: Alignment.topLeft,
                            // Donde termina el color
                            end: Alignment.bottomRight,
                            // Los colores que van a ser degradados
                            colors: [Colors.black, Colors.grey.shade600],
                          ),
                        ),
                        width: 350,
                        child: TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, "/login");
                          },
                          child: Text(
                            "Iniciar sesión",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ),
                      ),
                    ),
                    // Botón de registrarse
                    Container(
                      width: 350,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [Colors.grey.shade600, Colors.black],
                        ),
                      ),
                      child: TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, "/register");
                        },
                        child: Text(
                          "Registrarte",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
