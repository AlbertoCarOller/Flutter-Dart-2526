void main() {
  try {
    // Creamos varios cursos
    Curso curso1 = Curso("Dart", 67, 45.99);
    Curso curso2 = Curso("Java", 160, 199.99);
    Curso curso3 = Curso("Kotlin", 100, 149.99);
    Curso curso4 = Curso("Swift", 200, 349.99);

    // Creamos varios estudiantes
    Estudiante estudiante1 = Estudiante("Paco", 25);
    Estudiante estudiante2 = Estudiante("Chelu", 40);
    Estudiante estudiante3 = Estudiante("Bermudo", 41);
    Estudiante estudiante4 = Estudiante("Atisbedo", 34);

    // Añadimos cursos a los estudiantes
    estudiante1.inscribirEnCurso(curso1);
    estudiante2.inscribirEnCurso(curso1);
    estudiante2.inscribirEnCurso(curso2);
    estudiante3.inscribirEnCurso(curso4);
    estudiante4.inscribirEnCurso(curso3);

    // Creamos la Academia y añadimos los estudiantes
    Academia academia = Academia();
    academia.incribirEstudiante(estudiante1);
    academia.incribirEstudiante(estudiante2);
    academia.incribirEstudiante(estudiante3);
    academia.incribirEstudiante(estudiante4);

    academia.listaEstudiantes.sort((e1, e2) => e1.edad.compareTo(e2.edad));
    print(
      "Estudiante más joven: ${academia.listaEstudiantes.firstOrNull?.nombre ?? "No hay datos"}",
    );
    print(
      "Estudiante mayor: ${academia.listaEstudiantes.lastOrNull?.nombre ?? "No hay datos"}",
    );
    academia.listaEstudiantes
        .where((e) => e.cursosApuntados.length > 1)
        .forEach(
          (e) => print(
            "Nombre: ${e.nombre}, Numero de cursos: ${e.cursosApuntados.length}",
          ),
        );
  } catch (e) {
    print(e);
  }
}

class Curso {
  String nombre;
  int duracionHoras;
  double costo;

  Curso(this.nombre, this.duracionHoras, this.costo);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Curso &&
          runtimeType == other.runtimeType &&
          nombre == other.nombre;

  @override
  int get hashCode => nombre.hashCode;
}

class EstudianteException implements Exception {
  String mensaje;

  EstudianteException(this.mensaje);

  @override
  String toString() {
    return 'EstudianteException{mensaje: $mensaje}';
  }
}

class Estudiante {
  String nombre;
  int edad;
  List<Curso> cursosApuntados = [];

  Estudiante(this.nombre, this.edad) {
    if (edad < 0) {
      throw EstudianteException("La edad no es válida");
    }
  }

  void inscribirEnCurso(Curso curso) {
    if (!cursosApuntados.contains(curso)) {
      cursosApuntados.add(curso);
    }
  }
}

mixin ReporteFinanciero {
  double calcularCostoTotal(List<Estudiante> estudiantes) {
    /* Esto está mal ya que las {} se interpreta como un Set, los bloques
     de código no son compatibles con '=>' */
    /*return estudiantes.map((e) => {
      e.cursosApuntados.map((c) => c.costo).reduce((o1, o2) => o1 + o2)
    }).reduce((l1, l2) => l1 + l2);*/

    // Esta es la versión correcta, en la que no utilizamos las {}
    return estudiantes
        .map(
          (e) =>
              e.cursosApuntados.map((c) => c.costo).reduce((o1, o2) => o1 + o2),
        )
        .reduce((e1, e2) => e1 + e2);
  }
}

class Academia with ReporteFinanciero {
  List<Estudiante> listaEstudiantes = [];

  void incribirEstudiante(Estudiante estudiante) {
    listaEstudiantes.add(estudiante);
  }
}
