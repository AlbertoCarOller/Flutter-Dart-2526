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

enum Formato { dosD, tresD, imax }

class Sala {
  static List<int> asientosVendidos = [];
}

class Cartelera {
  static List<Pelicula> peliculas = []; /*[Pelicula("StarWars", ["16:00", "21:00"],
      precioBase, estreno, imagen)];^*/
}
