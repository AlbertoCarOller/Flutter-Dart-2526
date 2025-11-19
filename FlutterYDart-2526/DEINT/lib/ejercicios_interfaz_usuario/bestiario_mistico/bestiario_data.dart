enum Alineamiento { leal, neutral, caotico }

class Criatura {
  final String nombre;
  final Alineamiento alineamiento;
  final bool esHostil;
  final int nivelPeligro;

  Criatura(this.nombre, this.alineamiento, this.esHostil, this.nivelPeligro);
}

class BestiarioDataBase {
  static final List<Criatura> criaturas = [];

  static List<Criatura> getCriaturas() {
    return criaturas;
  }

  static void agregarCriatura(Criatura criatura) {
    criaturas.add(criatura);
  }
}
