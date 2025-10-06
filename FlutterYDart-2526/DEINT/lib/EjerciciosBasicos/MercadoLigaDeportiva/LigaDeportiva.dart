void main() {
  Equipo equipo = Equipo("El Triángulo de los Bermudos");
  equipo.agregarJugador(Jugador("Antonio", false, "12"));
  equipo.agregarJugador(Jugador("Alberto", true, "8"));
  equipo.agregarJugador(Jugador("Rivero", false));

  equipo.obtenerNombresConPosicion().forEach((n) => print(n));
}

class Jugador {
  String nombre;
  String? posicion; // -> En caso de que no se le pase un valor será null
  bool estaLesionado;

  // La posición es opcional
  Jugador(this.nombre, this.estaLesionado, [this.posicion]);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Jugador &&
          runtimeType == other.runtimeType &&
          nombre == other.nombre;

  @override
  int get hashCode => nombre.hashCode;
}

class Equipo {
  String nombre;
  int puntos = 0;
  List<Jugador> listaJugadores = [];

  Equipo(this.nombre);

  void agregarJugador(Jugador jugador) {
    (!listaJugadores.contains(jugador))
        ? listaJugadores.add(jugador)
        : print("El jugador ya está en el equipo");
  }

  List<String> obtenerNombresConPosicion() {
    return listaJugadores
        .where((j) => j.posicion != null)
        .map((j) => j.nombre)
        .toList();
  }
}
