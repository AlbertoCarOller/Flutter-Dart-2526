void main() {
  var persona = Persona("Atisbedo", null);
  persona.presentacion();
}

class Persona {
  String nombre;
  int? edad;

  Persona(this.nombre, [this.edad]);

  void presentacion() {
    print("Nombre: $nombre, Edad: ${edad ?? "No hay edad"}");
  }
}
