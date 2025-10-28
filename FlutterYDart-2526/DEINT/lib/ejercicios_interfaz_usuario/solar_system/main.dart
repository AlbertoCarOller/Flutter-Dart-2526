import 'package:flutter/material.dart';
import 'package:deint/ejercicios_interfaz_usuario/solar_system/Detalles.dart';
import 'package:deint/ejercicios_interfaz_usuario/solar_system/Lista_planetas.dart';
import 'package:deint/ejercicios_interfaz_usuario/solar_system/Planeta.dart';

void main() {
  runApp(MainPlanetario());
}

class MainPlanetario extends StatelessWidget {
  const MainPlanetario({super.key});

  @override
  Widget build(BuildContext context) {
    // Creamos una lista de planetas
    final List<Planeta> planetas = [
      Planeta("Earth", "assets/images/earth.png", "149.5 Millones KM",
          "Earth – our home planet – is the third planet from the Sun, and"
              " the fifth largest planet. It's the only place we know of"
              " inhabited by living things."),
      Planeta("Jupiter", "assets/images/jupiter.png", "778.3 Millones KM",
          "Jupiter is the fifth planet from the Sun, and the largest planet"
              " in our solar system."),
      Planeta("Mars", "assets/images/mars.png", "227.9 Millones KM", "Mars is"
          " the fourth planet from the Sun, and the seventh largest planet."),
      Planeta("Mercury", "assets/images/mercury.png", "57.9 Millones KM", "Mercury "
          "is the planet nearest to the Sun, and the smallest planet in our solar system."),
      Planeta("Moon", "assets/images/moon.png", "149.6 Millones KM", "The Moon is"
          " Earth's only natural satellite, a rocky body that orbits our planet."),
      Planeta("Neptune", "assets/images/neptune.png", "4.500 Millones KM", "Neptune"
          " is the eighth and most distant planet in our solar system. It's the"
          " fourth largest planet."),
      Planeta("Pluto", "assets/images/pluto.png", "5.900 Millones KM", "Pluto was"
          " long considered our solar system's ninth planet. It was reclassified"
          " as a dwarf planet in 2006 by the International Astronomical Union."),
      Planeta("Saturn", "assets/images/saturn.png", "1.430 Millones KM", "Saturn"
          " is the sixth planet from the Sun, the second largest planet in our solar system."),
      Planeta("Sun", "assets/images/sun.png", "0 Millones KM", "The Sun is the star at the"
          " center of our Solar System, providing the heat and light that sustain life on Earth."),
      Planeta("Uranus", "assets/images/uranus.png", "2.870 Millones KM", "Uranus is"
          " the seventh planet from the Sun, and the third largest planet in our solar system."),
      Planeta("Venus", "assets/images/venus.png", "108.2 Millones KM", "Venus is"
          " the second planet from the Sun, and the sixth largest planet."),
    ];
    return MaterialApp(
      title: "MainPlanetario",
      initialRoute: "/", // -> Ruta con la que incializa la app
      // Todas las rutas y donde llevan (forma nombrada común)
      /*routes: {
        "/": (context) => Listaplanetas(planetasEntradas: planetas),
        /* Hemos quitado el planeta en el constructor y lo hemos pasado como
         argumento en 'elemento_planetario', así no nos dará error al no
         poder pasar un planeta concreto*/
        "/detalles": (context) => Detalles(),
      },*/
      /* Controlamos las rutas nombradas pero la forma más moderna con onGenerateRoute
      * este deja pasar argumentos gracias al 'settings', los argumentos
      * se pasan en el Navigator.pushNamed() concreto y aquí se "desempaqueta"
      * para enviarlo como parámetro, IMPORTANTE ESTO ANULA EL PASAR DIRECTAMENTE
      * LOS ARGUMENTOS A LOS RESPECTIVOS DESTINOS, TIENE QUE PASAR POR AQUÍ Y
      * DESPUÉS ENVIARLO COMO PARÁMETRO */
      onGenerateRoute: (settings) {
        switch (settings.name) {
          // En caso de que sea la ruta inicial vamos a 'ListaPlanetas'
          case "/":
            return MaterialPageRoute(
              builder: (context) => ListaPlanetas(planetasEntradas: planetas),
            );

          // En caso de que sea '/detalles' vamos a los detalles
          case "/detalles":
            // Creamos el planeta para ser enviado a 'Detalles'
            Planeta planeta = settings.arguments as Planeta;
            return MaterialPageRoute(
              // Redirigimos y enviamos el planeta
              builder: (context) => Detalles(planeta: planeta),
            );

          default:
            return MaterialPageRoute(builder: (context) => Text("Error"));
        }
      },
    );
  }
}
