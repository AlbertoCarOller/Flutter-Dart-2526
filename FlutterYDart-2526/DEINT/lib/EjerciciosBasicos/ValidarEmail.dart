import 'package:email_validator/email_validator.dart'; // Importamos el EmailValidator

void main() {
  // Comrpobamos si el email es correcto
  print("¿Es el email válido? ${EmailValidator.validate("acaroll0401@g.educaand.es") ? "Sí" : "No"}");
}