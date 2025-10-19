import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(CuadroDeFallout());
}

class CuadroDeFallout extends StatelessWidget {
  const CuadroDeFallout({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "CuadroDeFallout",
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.orangeAccent),
      ),
      home: Cuadro(),
    );
  }
}

class Cuadro extends StatelessWidget {
  const Cuadro({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Fallout",
              // GoogleFonts -> Clase que nos permite editar el texto, darle una fuente, pero este es de google
              style: GoogleFonts.fugazOne(
                fontSize: 30,
                color: Colors.amber.shade600,
              ),
            ),
            Image(
              image: NetworkImage("https://i.imgur.com/CvWtPzp.png", scale: 8),
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          // Color de fondo
          Container(color: Colors.orangeAccent.shade100),
          Positioned.fill(
            // Imagen con cierta opacidad
            child: Opacity(
              opacity: 0.16,
              child: Image(
                fit: BoxFit.cover,
                image: NetworkImage(
                  "https://images.ctfassets.net/rporu91m20dc/"
                  "fze7Ze6DrhjVxoIEhBwRz/d222487a4dccc7dea521860b9133cb86/F76_S13_LCARD_776x470.jpg",
                ),
              ),
            ),
          ),
          Column(
            children: [
              // Expanded tiene el tamaño máximo de su padre, no es infinity, así no da problemas para el Grid
              Expanded(
                /* Cuadro de filas y columnas, con .count metemos nostros manualmente los hijos
                  * IMPORTANTE: a widgets como este hay que pasarle un tamaño que no sea infinito,
                  * de lo contrario colapsará */
                child: GridView.count(
                  padding: EdgeInsets.only(left: 15, right: 15),
                  // Número de columnas
                  crossAxisCount: 4,
                  // Espacio entre columnas
                  crossAxisSpacing: 5,
                  // Espacio entre filas
                  mainAxisSpacing: 5,
                  // Para definir el tamaño de cada celda (hijo)
                  childAspectRatio: 1.5,
                  children: [
                    Text(
                      "Fallout 4",
                      style: GoogleFonts.fugazOne(
                        color: Colors.amber.shade800,
                        fontSize: 20,
                      ),
                    ),
                    Container(
                      // Con BoxDecoration podemos ponerle bordes al container y demás
                      decoration: BoxDecoration(
                        // Colocamos una imagen dentro del container, como fondo
                        image: DecorationImage(
                          image: NetworkImage(
                            "https://i.redd.it/ibu5c31aph601.jpg",
                          ),
                          fit: BoxFit.cover,
                        ),
                        // Para poner bordes, en este caso en todos los lados
                        border: Border.all(
                          color: Colors.orangeAccent.shade700,
                          width: 4,
                        ),
                      ),
                    ),
                    Container(
                      // Con BoxDecoration podemos ponerle bordes al container y demás
                      decoration: BoxDecoration(
                        // Colocamos una imagen dentro del container, como fondo
                        image: DecorationImage(
                          image: NetworkImage(
                            "https://wallpapers.com/images/hd/fallout-4-computer-4hcyao78in7jg4la.jpg",
                          ),
                          fit: BoxFit.cover,
                        ),
                        // Para poner bordes, en este caso en todos los lados
                        border: Border.all(
                          color: Colors.orangeAccent.shade700,
                          width: 4,
                        ),
                      ),
                    ),
                    Container(
                      // Con BoxDecoration podemos ponerle bordes al container y demás
                      decoration: BoxDecoration(
                        // Colocamos una imagen dentro del container, como fondo
                        image: DecorationImage(
                          image: NetworkImage(
                            "https://wallpapers.com/images/hd/diamond-city-1920-x-1080-wallpaper-cgp9mfk2n5nnuszg.jpg",
                          ),
                          fit: BoxFit.cover,
                        ),
                        // Para poner bordes, en este caso en todos los lados
                        border: Border.all(
                          color: Colors.orangeAccent.shade700,
                          width: 4,
                        ),
                      ),
                    ),
                    Text(
                      "Fallout New Vegas",
                      style: GoogleFonts.fugazOne(
                        color: Colors.amber.shade800,
                        fontSize: 20,
                      ),
                    ),
                    Container(
                      // Con BoxDecoration podemos ponerle bordes al container y demás
                      decoration: BoxDecoration(
                        // Colocamos una imagen dentro del container, como fondo
                        image: DecorationImage(
                          image: NetworkImage(
                            "https://i.redd.it/fallout-new-vegas-art-in-4k-its-not-ai"
                            "-upscaled-its-the-v0-0orlyq1b7vyc1.jpg?width=2880&"
                            "format=pjpg&auto=webp&s=829f3c7062157e63583805e7b9f094acc8ef5fd7",
                          ),
                          fit: BoxFit.cover,
                        ),
                        // Para poner bordes, en este caso en todos los lados
                        border: Border.all(
                          color: Colors.orangeAccent.shade700,
                          width: 4,
                        ),
                      ),
                    ),
                    Container(
                      // Con BoxDecoration podemos ponerle bordes al container y demás
                      decoration: BoxDecoration(
                        // Colocamos una imagen dentro del container, como fondo
                        image: DecorationImage(
                          image: NetworkImage(
                            "https://i.imgur.com/Z6bPLkN.jpg",
                          ),
                          fit: BoxFit.cover,
                        ),
                        // Para poner bordes, en este caso en todos los lados
                        border: Border.all(
                          color: Colors.orangeAccent.shade700,
                          width: 4,
                        ),
                      ),
                    ),
                    Container(
                      // Con BoxDecoration podemos ponerle bordes al container y demás
                      decoration: BoxDecoration(
                        // Colocamos una imagen dentro del container, como fondo
                        image: DecorationImage(
                          image: NetworkImage(
                            "https://images.fallout.wiki/a/a4/FNV_Location_The_Strip_North_Gate.png",
                          ),
                          fit: BoxFit.cover,
                        ),
                        // Para poner bordes, en este caso en todos los lados
                        border: Border.all(
                          color: Colors.orangeAccent.shade700,
                          width: 4,
                        ),
                      ),
                    ),
                    Text(
                      "Fallout 76",
                      style: GoogleFonts.fugazOne(
                        color: Colors.amber.shade800,
                        fontSize: 20,
                      ),
                    ),
                    Container(
                      // Con BoxDecoration podemos ponerle bordes al container y demás
                      decoration: BoxDecoration(
                        // Colocamos una imagen dentro del container, como fondo
                        image: DecorationImage(
                          image: NetworkImage(
                            "https://cdn.arstechnica.net/wp-content/uploads/2025/10/FO76_BurningSprings_0925-3.jpg",
                          ),
                          fit: BoxFit.cover,
                        ),
                        // Para poner bordes, en este caso en todos los lados
                        border: Border.all(
                          color: Colors.orangeAccent.shade700,
                          width: 4,
                        ),
                      ),
                    ),
                    Container(
                      // Con BoxDecoration podemos ponerle bordes al container y demás
                      decoration: BoxDecoration(
                        // Colocamos una imagen dentro del container, como fondo
                        image: DecorationImage(
                          image: NetworkImage(
                            "https://static0.thegamerimages.com/wordpress/"
                            "wp-content/uploads/2018/11/fallout-76-emote-1-e1542840866147.jpg",
                          ),
                          fit: BoxFit.cover,
                        ),
                        // Para poner bordes, en este caso en todos los lados
                        border: Border.all(
                          color: Colors.orangeAccent.shade700,
                          width: 4,
                        ),
                      ),
                    ),
                    Container(
                      // Con BoxDecoration podemos ponerle bordes al container y demás
                      decoration: BoxDecoration(
                        // Colocamos una imagen dentro del container, como fondo
                        image: DecorationImage(
                          image: NetworkImage(
                            "https://assets.newsweek.com/wp-content/uploads/2025/"
                            "08/1220110-fallout-76-scrap-loot-locations-junk.png?w=1600&quality=75&webp=1",
                          ),
                          fit: BoxFit.cover,
                        ),
                        // Para poner bordes, en este caso en todos los lados
                        border: Border.all(
                          color: Colors.orangeAccent.shade700,
                          width: 4,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
