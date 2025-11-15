//Un enum que representa el tipo de poder del héroe
enum Poder {
  vuelo,
  fuerza,
  psiquico,
}

// Creamos la clase Heroe
class Heroe {
  final String nombre;
  final Poder poder;
  final bool esAliado;
  final int nivel;

  Heroe({
    required this.nombre,
    required this.poder,
    required this.esAliado,
    required this.nivel,
  });
}

// Creamos una clase que va a almacenar los héroes creados
class HeroeDatabase {
  // Una lista ESTÁTICA. Significa que es compartida por TODA la app.
  static final List<Heroe> _heroes = [];

  // Un método ESTÁTICO para obtener la lista
  static List<Heroe> getHeroes() {
    return _heroes;
  }

  // Un método ESTÁTICO para añadir un héroe
  static void addHeroe(Heroe heroe) {
    _heroes.add(heroe);
  }
}