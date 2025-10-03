void main() {
  print("Suma1:${suma(7, null)}");
  print("Suma2: ${suma(null, 10)}");
  print("Suma3: ${suma(null, null)}");
}

int? suma([int? num1, int? num2]) {
  return (num1 ?? 0) + (num2 ?? 0);
}