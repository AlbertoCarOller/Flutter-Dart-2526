void main() {
  // Creamos una canción
  var cancion = Cancion("Que cupido te fleche", "LuXna", 168);
  cancion.reproducir();
  cancion.agregarAFavoritos();
}

class Cancion {
  String titulo;
  String artista;
  int duracionEnSegundos;
  bool estaEnFavoritas = false;

  Cancion(this.titulo, this.artista, this.duracionEnSegundos);

  // Creamos una función que va a simular la reproducción de la canción
  void reproducir() {
    print("Reproduciendo la canción '$titulo' de '$artista'");
  }

  // Creamos una función que va a añadir a favoritos la canción
  void agregarAFavoritos() {
    estaEnFavoritas = true;
    print("Se ha añadido '$titulo' a favoritas");
  }
}
