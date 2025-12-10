class Pelicula {
  String titulo;
  List<String> horarios;
  double precioBase;
  bool estreno;
  String imagen;
  Sala sala;

  Pelicula(
    this.titulo,
    this.horarios,
    this.precioBase,
    this.estreno,
    this.imagen,
    this.sala,
  );
}

// Enum con valor, los valores van entre ()
enum Formato {
  dosD(0),
  tresD(2),
  imax(4);

  // Se debe de crear una varible con el precio extra, que acumule el valor de esa variable
  final int precioExtra;

  // Creamos un constructor que acepte el precio extra
  const Formato(this.precioExtra);
}

class Sala {
  // Una lista con los índices de los asientos vendidos
  List<int> asientosVendidos = [];

  // El número de asientos totales de la sala
  int numAsientos;

  Sala(this.numAsientos);
}

class Cartelera {
  // Creamos una lista de películas de forma estática ya con valores predefinidos
  static List<Pelicula> peliculas = [
    Pelicula(
      "Star Wars",
      ["16:00", "21:00"],
      7,
      false,
      "/images/cine_cartelera/starwars.jpg",
      Sala(20),
    ),
    Pelicula(
      "La forma del Agua",
      ["12:00", "20:00"],
      12,
      false,
      "/images/cine_cartelera/laFormaDelAgua.jpg",
      Sala(30),
    ),
    Pelicula(
      "Los 4 fantásticos",
      ["20:30"],
      15,
      true,
      "/images/cine_cartelera/4fantasticos.jpg",
      Sala(30),
    ),
    Pelicula(
      "Avengers Domsday",
      ["22:00", "16:45"],
      17,
      true,
      "/images/cine_cartelera/avengersDomsday.jpg",
      Sala(40),
    ),
    Pelicula(
      "El Laberinto del Fauno",
      ["18:20"],
      5,
      false,
      "/images/cine_cartelera/elLaberientoDelFauno.jpg",
      Sala(30),
    ),
    Pelicula(
      "Fallout Season 2",
      ["12:00", "9:00"],
      7,
      true,
      "/images/cine_cartelera/falloutPoster.jpeg",
      Sala(35),
    ),
    Pelicula(
      "Harry Potter",
      ["19:25", "15:30"],
      2,
      false,
      "/images/cine_cartelera/harryPotter.jpeg",
      Sala(25),
    ),
    Pelicula(
      "Stranger Things 5",
      ["12:00"],
      20,
      true,
      "/images/cine_cartelera/strangerThings5.jpg",
      Sala(30),
    ),
  ];
}
