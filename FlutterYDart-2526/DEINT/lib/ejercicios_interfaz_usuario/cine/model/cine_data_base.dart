class Pelicula {
  String titulo;
  List<String> horarios;
  double precioBase;
  bool estreno;
  Formato formato;
  String imagen;

  Pelicula(
    this.titulo,
    this.horarios,
    this.precioBase,
    this.estreno,
    this.formato,
    this.imagen,
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
  static List<int> asientosVendidos = [];
}

class Cartelera {
  // Creamos una lista de películas de forma estática ya con valores predefinidos
  static List<Pelicula> peliculas = [
    Pelicula(
      "Star Wars",
      ["16:00", "21:00"],
      7,
      false,
      Formato.dosD,
      "/images/cine_cartelera/starwars.jpg",
    ),
    Pelicula(
      "La forma del Agua",
      ["12:00", "20:00"],
      12,
      false,
      Formato.tresD,
      "/images/cine_cartelera/laFormaDelAgua.jpg",
    ),
    Pelicula(
      "Los 4 fantásticos",
      ["20:30"],
      15,
      true,
      Formato.imax,
      "/images/cine_cartelera/4fantasticos",
    ),
    Pelicula(
      "Avengers Domsday",
      ["22:00", "16:45"],
      17,
      true,
      Formato.imax,
      "/images/cine_cartelera/avengersDomsday",
    ),
    Pelicula(
      "El Laberinto de Fauno",
      ["18:20"],
      5,
      false,
      Formato.dosD,
      "/images/cine_cartelera/elLaberientoDelFauno.jpg",
    ),
    Pelicula(
      "Fallout Season 2",
      ["12:00", "9:00"],
      7,
      true,
      Formato.tresD,
      "/images/cine_cartelera/falloutPoster.jpeg",
    ),
    Pelicula(titulo, horarios, precioBase, estreno, formato, imagen)
  ];
}
