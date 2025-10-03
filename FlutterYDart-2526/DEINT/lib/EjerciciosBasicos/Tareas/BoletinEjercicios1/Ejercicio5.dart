void main() {
  print("Elemento: ${buscarElemento([3, 2, 4, 1], 1)}");
  print(obtenerResultado([4, 3, 1, 8], 9));
}

int? buscarElemento(List<int> lista, int numABuscar) {
  int? indice = lista.indexOf(numABuscar);
  return (indice < 0) ? null : indice;
}

String obtenerResultado(List<int> lista, int numABuscar) {
  int? indice = lista.indexOf(numABuscar);
  String? indiceS = "$indice";
  if (indice == -1) {
    indiceS = null;
  }
  return indiceS ?? "No se ha encontrado";
}
