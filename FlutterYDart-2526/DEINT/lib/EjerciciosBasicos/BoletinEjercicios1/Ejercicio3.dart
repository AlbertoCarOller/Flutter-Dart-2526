void main() {
  print(
    "Lista: ${filtrarLista(["Dartico", "Serapio", "Atisbedo", null]) ?? "No hay datos"}",
  );
  print(
    "Lista1: ${filtrarLista([null, null, null, null]) ?? "No hay datos"}",
  );
}

List<String>? filtrarLista(List<String?> lista) {
  List<String>? listaNoNull = [];
  for (var i in lista) {
    if (i != null) {
      listaNoNull.add(i);
    }
  }
  if (listaNoNull.isEmpty) {
    listaNoNull = null;
  }
  return listaNoNull;
}
