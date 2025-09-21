void main() {
  Estudiante estudiante = Estudiante("Pepa");
  estudiante.agregarCalificacion("mates", 8);
  estudiante.agregarCalificacion("lengua", 6);
  estudiante.agregarCalificacion("física", 4.8);
  estudiante.agregarCalificacion("naturales", 10);
  print("Nota asignatura: ${estudiante.obtenerCalificacion("física")}");
  print("Promedio asignaturas: ${estudiante.calcularPromedio()}");
}

class Estudiante {
  String nombre;
  Map<String, double> calificaciones = {};

  // Hacemos el constructor
  Estudiante(this.nombre);

  // Hacemos una función que va a añadir una calificación
  void agregarCalificacion(String asignatura, double nota) {
    if (!calificaciones.containsKey(asignatura)) {
      // Añadimos la clave (asignatura) y el valor (nota)
      calificaciones[asignatura] = nota;
    }
  }

  double calcularPromedio() {
    double suma = 0.0;
    for (var i in calificaciones.values) {
      suma += i;
    }
    return suma / calificaciones.length;
  }

  double? obtenerCalificacion(String asignatura) {
    return calificaciones[asignatura];
  }
}
