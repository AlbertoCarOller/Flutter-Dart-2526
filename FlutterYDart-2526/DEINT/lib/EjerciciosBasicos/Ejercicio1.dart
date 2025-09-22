import 'dart:math';
import 'dart:io';

void main() {
  saludar("Pepe");
  saludar("Pepa");
  saludar("Atisbedo");

  // .toStringAsFixed(numDecimales) devuelve los decimales que indiquemos
  print("Precio IVA: ${calcularIva(20.5).toStringAsFixed(2)}");
  print("Suma de pares ${sumarPares([1, 5, 8, 12, 3, 10, 7])}");

  var miPapilla = Producto("Papilla", 34.9, 5);
  miPapilla.mostrarInfo();
  print("Producto: ${miPapilla.nombre}");

  var sesion = Sesion();
  sesion.login();

  // Probamos la función
  print(calcularPrecioFinal(100));
  print(calcularPrecioFinal(150, descuentoFijo: 0.10));
  print(calcularPrecioFinal(200, descuentoPorcentual: 0.15));
  print(calcularPrecioFinal(300, descuentoPorcentual: 0.20, descuentoFijo: 10));
}

void saludar(String nombre) {
  print("Hola, soy $nombre");
}

double calcularIva(double precio) {
  return precio + (precio * 0.21);
}

int sumarPares(List<int> lista) {
  var suma = 0;
  for (var i in lista) {
    if (i % 2 == 0) {
      suma += i;
    }
  }
  return suma;
}

class Producto {
  String nombre;
  double precio;
  int stock;

  Producto(this.nombre, this.precio, this.stock);

  void mostrarInfo() {
    print("$nombre, $precio, $stock");
  }
}

class Sesion {
  // Es constante porque su valor se conoce antes de ejecutarse el programa
  static const int maxIntentos = 5;
  final int idSesion = Random().nextInt(1000000) + 1;

  Sesion();

  void login() {
    var intentos = 0;
    var acierto = false;
    while (intentos < maxIntentos && !acierto) {
      print("Introduce el id");
      String? idUsuario = stdin.readLineSync();
      if (idUsuario != null) {
        if (idSesion == idUsuario) {
          acierto = true;
          print("Has iniciado sesión. ¡Bienvenido!");
          return;
        }
      }
      intentos++;
    }

    print("No has podido iniciar sesión después de 5 intentos.");
  }
}
/* Los agumentos entre llaves son opcionales y se le pasa por nombre, los que
 van por [] son opcionales */
double calcularPrecioFinal(double precioBase, {double descuentoPorcentual = 0.0,
double descuentoFijo = 0.0}) {
  if(descuentoPorcentual <= 100) {
    precioBase -= (precioBase * descuentoPorcentual);
  }
  if(descuentoFijo < precioBase) {
    return precioBase - descuentoFijo;
  } else {
    return precioBase;
  }
}
