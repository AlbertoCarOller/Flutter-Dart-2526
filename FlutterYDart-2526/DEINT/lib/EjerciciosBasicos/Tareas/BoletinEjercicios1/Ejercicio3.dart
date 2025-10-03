void main() {
  print("Lista: ${filtrarLista(["Dartico", "Serapio", "Atisbedo", null])}");
  print("Lista1: ${filtrarLista([null, null, null, null])}");
}

String filtrarLista(List<String?> lista) {
  List<String>? listaNoNull = [];
  for (var i in lista) {
    listaNoNull.add(i ?? "");
  }
  return comprobarVacio(listaNoNull.where((s) => s.isNotEmpty).toList());
}

String comprobarVacio(List<String> lista) {
  if (lista.isEmpty) {
    return "No hay datos";
  }
  return lista.toString();
}
