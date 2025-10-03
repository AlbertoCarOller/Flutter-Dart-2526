void main() {
  // Creamos una instancia de Temperatura
  Temperatura temperatura = Temperatura(25.0);
  print("Celsius: ${temperatura.temperatura} -> Fahrenheit: ${temperatura.aFahrenheit()}");
}

class Temperatura {
  double temperatura;

  Temperatura(this.temperatura);

  double aFahrenheit() {
    return (temperatura * 9 / 5) + 32;
  }
}
