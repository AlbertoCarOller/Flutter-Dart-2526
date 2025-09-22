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
