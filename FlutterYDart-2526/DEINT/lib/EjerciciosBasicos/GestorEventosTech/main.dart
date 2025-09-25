// TODO 1: Define una constante de compilación para el nombre de la organización.
// El nombre debe ser "Eventos Tech".
import 'dart:core';

const nombreEvento = "Eventos Tech";

// TODO 2: Define un Mixin llamado 'Notificable'
// Debe tener un método `enviarNotificacion(String email, String mensaje)`
// que simplemente imprima en consola: "Notificación enviada a [email]: [mensaje]".

mixin Notificable {
  void enviarNotificacion(String email, String mensaje);
}

// TODO 3: Define una clase abstracta 'Evento'
abstract class Evento {
  // Atributos: nombre (final, String), aforoMaximo (final, int)
  // y una lista de emails de asistentes (List<String>).
  final String nombre;
  final int aforoMaximo;
  List<String> asistentes = [];

  // Constructor que inicialice los atributos final.
  Evento({required this.nombre, required this.aforoMaximo});

  // Método para inscribir un asistente.
  // Debe aceptar un email (String) y un parámetro nombrado opcional `imprimirTicket` (bool, por defecto false).
  // Si el aforo no está completo, añade el email a la lista de asistentes.
  // Si `imprimirTicket` es true, debe imprimir "Ticket impreso para [email]".
  // Si el aforo está completo, debe imprimir "Aforo completo para el evento [nombre]".
  void inscribirAsistente(String email, {bool imprimirTicket = false}) {
    if (aforoMaximo == asistentes.length) {
      print("Aforo completo para el evento $nombre\n");
    } else {
      if (!asistentes.contains(email)) {
        asistentes.add(email);

        if (imprimirTicket) {
          print("Tiket impreso para $email\n");
        }
      } else {
        print("Ya estás incrito en la lista\n");
      }
    }
  }

  // Método abstracto `generarResumen` que devolverá un String.
  String generarResumen();

  @override
  String toString() {
    return 'Evento{nombre: $nombre, aforoMaximo: $aforoMaximo, asistentes: $asistentes}\n';
  }
}

// TODO 4: Crea una clase 'Conferencia' que herede de 'Evento'.
// Añade un atributo final `ponente` (String) y un `patrocinador` opcional (String?).
// Implementa el constructor y el método `generarResumen`.
// El resumen debe incluir el nombre, ponente y patrocinador (si existe).

class Conferencia extends Evento {
  final String ponente;
  String? patrocinador;

  Conferencia(
    this.ponente, {
    this.patrocinador,
    required super.nombre,
    required super.aforoMaximo,
  });

  @override
  String generarResumen() {
    if (patrocinador != null) {
      return "Nombre: $nombre, Ponente: $ponente, Patrocinador: $patrocinador\n";
    } else {
      return "Nombre: $nombre, Ponente: $ponente\n";
    }
  }

  @override
  String toString() {
    return 'Conferencia{nombre: $nombre, aforoMaximo: $aforoMaximo, asistentes: $asistentes,'
        ' ponente: $ponente, patrocinador: $patrocinador}\n';
  }
}

// TODO 5: Crea una clase 'TallerPractico' que herede de 'Evento' y use el mixin 'Notificable'.
// Añade un atributo `materialNecesario` (List<String>).
// Implementa el constructor y el método `generarResumen`.
// El resumen debe incluir el nombre y los materiales necesarios.

class TallerPractico extends Evento with Notificable {
  List<String> materialNecesario = [];

  TallerPractico(
    this.materialNecesario, {
    required super.nombre,
    required super.aforoMaximo,
  });

  @override
  String generarResumen() {
    String resumen = "Nombre: $nombre, Materiales: ";
    for (var i in materialNecesario) {
      resumen += "[$i] ";
    }
    return resumen += "\n";
  }

  @override
  void enviarNotificacion(String email, String mensaje) {
    print("Email enviado a $email: $mensaje");
  }

  @override
  String toString() {
    return 'TallerPractico{nombre: $nombre, aforoMaximo: $aforoMaximo, asistentes: $asistentes materialNecesario: $materialNecesario}';
  }
}

// TODO 6: Crea una función de orden superior `filtrarEventosPorAforo`.
// Debe recibir una lista de Eventos y un aforo mínimo.
// Debe devolver una nueva lista solo con los eventos que tengan un aforo mayor al mínimo indicado.
// Usa una función anónima (lambda) para el filtrado.

// Declaramos una función anónima con Function
Function filtrarEventosPorAforo = (List<Evento> lista, int aforoMin) {
  // El .where aquí es como el .filter en Java
  return lista.where((i) => i.aforoMaximo > aforoMin).toList();
};

void main() {
  // TODO 7: Crea una instancia de 'Conferencia' y otra de 'TallerPractico'.
  var conferencia = Conferencia(
    "Sech",
    patrocinador: "Chelu",
    nombre: "Concierto Sech",
    aforoMaximo: 800,
  );
  var tallerPractico = TallerPractico(
    ["Alfombra", "Pala", "Cofre de madera"],
    nombre: "Sea of Thieves Simulator",
    aforoMaximo: 4,
  );

  // TODO 8: Inscribe a varios asistentes en cada evento, probando el límite de aforo
  // y el parámetro opcional `imprimirTicket`.
  conferencia.inscribirAsistente("chelu@gmail.com", imprimirTicket: true);
  conferencia.inscribirAsistente("sechoficial@outlook.com");
  conferencia.inscribirAsistente("xavier@g.educaand.es");

  tallerPractico.inscribirAsistente(
    "senseivallejo@gmail.com",
    imprimirTicket: true,
  );
  tallerPractico.inscribirAsistente("sensei@gmail.com");
  tallerPractico.inscribirAsistente(
    "juanvillalbazo@outlook.com",
    imprimirTicket: true,
  );
  tallerPractico.inscribirAsistente("lolitogoku@gmail.com");

  // TODO 9: Llama al método del mixin en la instancia de 'TallerPractico' para notificar
  // a un asistente sobre los materiales.
  tallerPractico.enviarNotificacion(
    "euyin@gmail.com",
    "Buenas tardes Euyin ¿Cómo estás? ¿Vas a venir?",
  );

  // TODO 10: Crea una lista con los eventos que has creado.
  List<Evento> listaEventos = [conferencia, tallerPractico];

  // TODO 11: Usa la función `filtrarEventosPorAforo` para encontrar eventos con más de 100 plazas.
  List<Evento> lista = filtrarEventosPorAforo(listaEventos, 100);
  print("-------Eventos mayor a 100 personas de aforo-------");
  lista.forEach((e) => print(e.nombre));

  // TODO 12: Itera sobre la lista original de eventos e imprime el resumen de cada uno
  // usando el método `generarResumen`.
  print("------Eventos-------");
  listaEventos.forEach((e) => print(e.generarResumen()));
}
