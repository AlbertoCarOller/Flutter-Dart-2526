void main() {
  Evento evento = Evento("Concierto del Sech");
  evento.invitar("Chelu Carmona");
  evento.invitar("Serapio");
  evento.invitar("Atisbedo");
  evento.invitar("Respicio Godefrío");

  print("Asistencia: ${evento.confirmarAsistencia("Chelu Carmona")}");
  evento.mostrarInvitados();
}

class Evento {
  String nombre;
  Set<String> invitados = {};

  Evento(this.nombre);

  void invitar(String nombreInvitado) {
    invitados.add(nombreInvitado);
  }

  bool confirmarAsistencia(String invitado) {
    return invitados.contains(invitado);
  }

  void mostrarInvitados() {
    invitados.forEach(print);
  }
}
