void main() {
  List<Tarea> listaTareas = [
    Tarea("Hacer la compra"),
    Tarea("Limpiar la casa"),
    Tarea("Hacer la comida"),
    Tarea("Fregar los platos"),
    Tarea("Poner la lavadora"),
    Tarea("Tender la ropa"),
  ];
  buscarTarea("Hacer la compra", listaTareas);
}

// Creamos la clase tarea
class Tarea {
  String descripcion;
  bool completada = false;

  // Hacemos el constructor
  Tarea(this.descripcion);

  // Hacemos una función para completar una tarea
  void completarTarea() {
    completada = true;
    print("Tarea completada: $descripcion");
  }

  @override
  String toString() {
    return 'Tarea{descripcion: $descripcion, completada: $completada}';
  }
}

void buscarTarea(String descripcion, List<Tarea> listaTareas) {
  // for por objetos
  for (var i in listaTareas) {
    if (i.descripcion == descripcion) {
      i.completarTarea();
    }
    print(i);
    /*
      El for por índices es igual que el de Java
      for(int i = 0; i < listaTareas.length;i++) {
      }*/
  }
}
