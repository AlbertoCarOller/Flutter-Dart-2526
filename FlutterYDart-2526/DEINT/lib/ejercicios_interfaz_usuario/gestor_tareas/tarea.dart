enum Prioridad { baja, media, alta }

class Tarea {
  String descripcion;
  Prioridad prioridad;
  bool completada;

  Tarea(this.descripcion, this.prioridad, this.completada);
}

class TareaDatabase {
  // La lista "global" de tareas
  static final List<Tarea> _tareas = [];

  // Método para obtener la lista
  static List<Tarea> getTareas() {
    return _tareas;
  }

  // Método para añadir una tarea
  static void addTarea(Tarea tarea) {
    _tareas.add(tarea);
  }

  // (Opcional, pero recomendado) Un método para cambiar el estado de una tarea
  static void toggleCompletada(Tarea tarea) {
    tarea.completada = !tarea.completada;
  }
}
