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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            // La parte que contiene el logo de la app
            child: Container(
              alignment: Alignment.center,
              child: Image.asset(
                "assets/images/logoKivoCompleto.png",
                scale: 2,
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.only(right: 30, left: 30, top: 20),
                child: Column(
                  children: [
                    // Bbotón de inicio de sesión
                    Padding(
                      padding: const EdgeInsets.only(bottom: 6),
                      child: Container(
                        width: 350,
                        color: Colors.black,
                        child: TextButton(
                          onPressed: () {},
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
                      color: Colors.black,
                      child: TextButton(
                        onPressed: () {},
                        child: Text(
                          "Registrarte",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
