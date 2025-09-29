void main() {
  print(
    'Producto más caro: ${productoMasCaro([Producto("Chocolate Dubai", 10.8),
      Producto("Vainilla"), Producto("Chocolate Nestle", 7.3)])}',
  );
}

String productoMasCaro(List<Producto> listaProductos) {
  // Descartamos los productos que no tengan el precio
  List<Producto> lista = listaProductos.where((p) => p.precio != null).toList();
  // Ordenamos de manera descendente la lista
  lista.sort((p1, p2) => p2.precio!.compareTo(p1.precio!));
  return lista.firstOrNull?.nombre ?? "No hay productos válidos";
}

class Producto {
  String nombre;
  double? precio;

  Producto(this.nombre, [this.precio]);
}
