void main() {
  List<Vehiculo> inventario = [
    Coche(4, "Seat", "Leon", 2300.0),
    Coche(2, "Ferrari", "C34", 12199.99),
    Moto(true, "Vespa", "ECO", 349.99),
    Moto(false, "Vespa", "ACRI", 299.99),
  ];

  // Simulamos la auditía de un vehículo
  inventario[0].realizarAuditoria();

  // Imprimimos la marca y el modelo de todos los vehículos
  inventario.forEach((v) => print("Marca: ${v.marca}, Modelo: ${v.modelo}"));

  // Mostramos los vehículos que cuestan más de 1000 EUR
  inventario.where((v) => v.precio > 1000).forEach((v) => print(v));
}

mixin Auditable {
  void realizarAuditoria() {
    print("Auditoría de seguridad realizada exitosamente\n");
  }
}

abstract class Vehiculo with Auditable {
  String marca;
  String modelo;
  double precio;

  // Creamos el constructor
  Vehiculo(this.marca, this.modelo, this.precio);

  @override
  String toString() {
    return 'Vehiculo{marca: $marca, modelo: $modelo, precio: $precio}';
  }
}

class Coche extends Vehiculo {
  int numPuertas;

  Coche(this.numPuertas, super.marca, super.modelo, super.precio);
}

class Moto extends Vehiculo {
  bool tieneCajaLateral;

  Moto(this.tieneCajaLateral, super.marca, super.modelo, super.precio);
}
