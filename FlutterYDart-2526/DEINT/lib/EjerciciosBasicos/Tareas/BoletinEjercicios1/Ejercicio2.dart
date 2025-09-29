void main() {
  print(
    "Suma precios: ${sumarPrecios({"Chocolate": 12.2, "Vainilla": 11.5, "Fresa": null})}",
  );
}

double sumarPrecios(Map<String, double?> mapaProductos) {
  var sumaPrecios = 0.0;
  /*for (var i in mapaProductos.values) {
    sumaPrecios += (i ?? 0);*/
  for (var i in mapaProductos.values) {
    if (i != null) {
      sumaPrecios += i!;
    }
  }
  return sumaPrecios;
}
