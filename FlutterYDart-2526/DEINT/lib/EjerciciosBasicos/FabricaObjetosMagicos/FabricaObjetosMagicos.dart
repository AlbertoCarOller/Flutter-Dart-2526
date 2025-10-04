void main() {
  Fabrica fabrica = Fabrica();
  Arma arma1 = Arma("Flecha de fuego", 8, 1, 3);
  Arma arma2 = Arma("Espada dorada", 3, 10, 7);
  Armadura armadura1 = Armadura("Armadura del dragón", 5, 8, 6);
  Armadura armadura2 = Armadura("Armadura oscura", 7, 20, 10);

  fabrica.agregarItem(arma1);
  fabrica.agregarItem(arma2);
  fabrica.agregarItem(armadura1);
  fabrica.agregarItem(armadura2);

  fabrica.auditarItems();

  fabrica.inventario
      .where((i) => i.valorBase > 5)
      .forEach((i) => print(i.nombre));
}

mixin Encantamiento {
  int nivelEncantamiento = 1;

  void aplicarEfecto() {
    print("Un resplandor y hace pum. Nivel: $nivelEncantamiento");
  }
}

class Item with Encantamiento {
  String nombre;
  double valorBase;
  double peso;

  Item(this.nombre, this.valorBase, this.peso);
}

class Arma extends Item {
  int dano;

  Arma(super.nombre, super.valorBase, super.peso, this.dano);
}

class Armadura extends Item {
  int defensa;

  Armadura(super.nombre, super.valorBase, super.peso, this.defensa);
}

class Fabrica {
  List<Item> inventario = [];

  void agregarItem(Item item) {
    inventario.add(item);
  }

  void auditarItems() {
    inventario.forEach((i) => i.aplicarEfecto());
  }
}
