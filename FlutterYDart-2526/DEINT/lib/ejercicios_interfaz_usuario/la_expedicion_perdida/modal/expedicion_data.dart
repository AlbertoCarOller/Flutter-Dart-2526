class ItemEquipo {
  String nombre;
  double peso;

  ItemEquipo(this.nombre, this.peso);
}

class TemploData {
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
  ];
}
