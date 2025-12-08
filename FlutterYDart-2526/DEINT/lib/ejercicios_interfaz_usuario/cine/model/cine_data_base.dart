class Pelicula {
  String titulo;
  List<String> horarios;
  double precioBase;
  bool estreno;
  String imagen;

  Pelicula(
    this.titulo,
    this.horarios,
    this.precioBase,
    this.estreno,
    this.imagen,
  );
}

// Enum con valor (REVISAR Y COMENTAR)
enum Formato { dosD(0), tresD(2), imax(4);
  final int precioExtra;

  const Formato(this.precioExtra);
}

class Sala {
  static List<int> asientosVendidos = [];
}

class Cartelera {
  static List<Pelicula> peliculas = []; /*[Pelicula("StarWars", ["16:00", "21:00"],
      precioBase, estreno, imagen)];^*/
}
