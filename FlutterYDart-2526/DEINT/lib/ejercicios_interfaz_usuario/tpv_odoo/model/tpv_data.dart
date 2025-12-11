class Producto {
  String nombre;
  double precio;
  String imagen;
  int cantidad = 0;

  Producto(this.nombre, this.precio, this.imagen);

  // Es el equals como en Java, comparamos por nombre
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Producto &&
          runtimeType == other.runtimeType &&
          nombre == other.nombre;

  @override
  int get hashCode => nombre.hashCode;
}

class TPVData {
  static List<Producto> productos = [
    Producto(
      "MacBook M5",
      2600.34,
      "https://png.pngtree.com/png-vector/20221004/ourmid/pngtree-apple-macbook-pro-mockup-png-image_6277127.png",
    ),
    Producto(
      "iPhone 17 Pro",
      1200,
      "https://es.mobile.spectrum.com/sdres/dcloudinary/spectrumobile/image/upload/Spectrum%20Mobile/Apple/iPhone17/iPhone-17-Lavender-256GB-HERO.png?mpflush_08-19-2025=true",
    ),
    Producto(
      "Aspiradora",
      450.12,
      "https://cdn-icons-png.flaticon.com/512/531/531178.png",
    ),
    Producto(
      "Portátil Lenovo",
      550.50,
      "https://png.pngtree.com/png-vector/20250323/ourmid/pngtree-sleek-gray-lenovo-laptop-displaying-windows-operating-system-png-image_15856147.png",
    ),
    Producto(
      "Mause Lenovo",
      125.45,
      "https://www.dokkantech.com/cdn/shop/files/Lenovo150WirelessMouse-Black.png?v=1729601408",
    ),
    Producto(
      "Alfombrilla",
      34.79,
      "https://cdn-icons-png.flaticon.com/512/2132/2132579.png",
    ),
  ];
  static List<Producto> productosSeleccionados = [];

  /// Eliminamos la cantidad de un producto seleccionado
  static eliminarCantidad(int index) {
    productosSeleccionados.elementAt(index).cantidad = 0;
  }

  /// Eliminamos la cantidad de los productos seleccionados
  static eliminarTodasCantidades() {
    for (Producto producto in productosSeleccionados) {
      producto.cantidad = 0;
    }
  }

  /// Esta función calcula el total de los productos tendiendo en cuenta
  /// los precios y la cantidad
  static double calcularPrecioTotal() {
    double total = 0;
    productosSeleccionados
        .map((p) => p.cantidad * p.precio)
        .toList()
        .forEach((s) => total += s);
    return total;
  }
}
