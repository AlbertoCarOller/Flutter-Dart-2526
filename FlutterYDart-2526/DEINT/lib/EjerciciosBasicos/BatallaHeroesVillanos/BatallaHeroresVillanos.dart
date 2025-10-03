void main() {
  Heroe heroe1 = Heroe("Paco", 10);
  Villano villano1 = Villano("Alvaro", 20);
  Heroe heroe2 = Heroe("Serapio", 15);
  Villano villano2 = Villano("Bermudin", 30);

  heroe1.atacar(villano1);
  heroe2.atacar(villano2);

  List<Personaje> listaPersonajes = [heroe1, heroe2, villano1, villano2];
  listaPersonajes.where((p) => p.ataqueBase > 15).map((p) => p.nombre)
  .forEach(print);
}

class Personaje {
  String nombre;
  int vida = 100;
  int ataqueBase;

  Personaje(this.nombre, this.ataqueBase);

  void recibirDanio(int danio) {
    if (vida == 0) {
      print("No puedes volver a morir $nombre");
    } else {
      (danio < vida)
          ? print("Vida restante $nombre: ${vida -= danio}")
          : print("Ha muerto $nombre, vida: ${vida = 0}");
    }
  }
}

class Heroe extends Personaje {
  Heroe(super.nombre, super.ataqueBase);

  void atacar(Personaje objetivo) {
    if (objetivo.vida != 0) {
      objetivo.recibirDanio(ataqueBase);
      print("$nombre ha atacado a ${objetivo.nombre}");
    }
  }
}

class Villano extends Personaje {
  Villano(super.nombre, super.ataqueBase);

  void usarHabilidadEspecial(Personaje objetivo) {
    if (objetivo.vida != 0) {
      objetivo.recibirDanio(ataqueBase * 2);
      print(
        "$nombre ha utilizado habilidad especial contra ${objetivo.nombre}",
      );
    }
  }
}
