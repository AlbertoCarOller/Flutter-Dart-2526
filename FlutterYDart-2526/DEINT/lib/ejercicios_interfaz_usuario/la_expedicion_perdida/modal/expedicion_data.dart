import 'dart:math';

class ItemEquipo {
  String nombre;
  double peso;

  ItemEquipo(this.nombre, this.peso);
}

class TemploData {
  // La lista de items
  static List<ItemEquipo> mochilaInicial = [
    ItemEquipo("Cuerda", 2),
    ItemEquipo("Sombrero", 0.5),
    ItemEquipo("Bote de canicas", 2.2),
    ItemEquipo("Botella de agua", 0.5),
    ItemEquipo("Lata de albóndigas", 0.7),
    ItemEquipo("iPhone 17 pro", 2.5),
    ItemEquipo("Bola de bolos", 5),
    ItemEquipo("Peluca", 0.2),
    ItemEquipo("Mechero", 0.4),
    ItemEquipo("Kapsalon medio", 3.3),
    ItemEquipo("Bote de salsa blanca", 2.7),
    ItemEquipo("Bate de béisbol", 4.4),
    ItemEquipo("Bola de béisbol", 3.3),
    ItemEquipo("Destornillador", 2.5),
    ItemEquipo("Gafas de sol", 1.9),
    ItemEquipo("Bote de maní", 1.6),
    ItemEquipo("Mascarilla", 0.2),
  ];

  /// Esta función va a devolver una lista con 30 números para cada fila
  /// (número del 0 al 3, que es el número de columna salvado)
  static List<int> generarCaminoCorrecto() {
    Random r = Random();
    List<int> listaColumnaCorrecta = [];
    for (int i = 0; i < 30; i++) {
      listaColumnaCorrecta.add(r.nextInt(4));
    }
    return listaColumnaCorrecta;
  }

  /// Esta función va a devolver el peso total del inventario (mochila)
  /// actual del usuario
  static double calcularPesoTotal() {
    double pesoTotal = 0;
    for (var i in mochilaInicial) {
      pesoTotal += i.peso;
    }
    return pesoTotal;
  }
}
