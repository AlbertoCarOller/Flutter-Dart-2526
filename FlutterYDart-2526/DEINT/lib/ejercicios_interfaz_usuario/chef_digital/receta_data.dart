class Ingrediente {
  String nombre;
  double cantidadGramos;

  Ingrediente(this.nombre, this.cantidadGramos);
}

class Receta {
  String nombrePlato;
  double calorias;
  double grasas;
  double proteinas;
  bool esVegano;
  int dificultad;
  List<Ingrediente> ingredientes;

  Receta(
    this.nombrePlato,
    this.calorias,
    this.grasas,
    this.proteinas,
    this.esVegano,
    this.dificultad,
    this.ingredientes,
  );
}

class RecetarioDatabase {
  static final List<Receta> _recetas = [];

  static List<Receta> get recetas => _recetas;

  static void agregarReceta(Receta receta) {
    _recetas.add(receta);
  }
}
