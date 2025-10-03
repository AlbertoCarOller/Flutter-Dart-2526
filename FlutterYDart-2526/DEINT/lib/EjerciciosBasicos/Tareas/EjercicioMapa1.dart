void main() {
  Map<String, String> info = {
    "Nombre": "Alberto",
    "Profesión": "Estudiante",
    "Pais": "España",
    "Ciudad": "Isla Cristina",
  };
  // Cambiamos la ciudad y el país
  info["Ciudad"] = "Lisboa";
  info["Pais"] = "Portugal";

  // Mostramos la inforación
  info.forEach((k, v) => print("$k -> $v"));
}
