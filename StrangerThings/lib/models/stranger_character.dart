class StrangerCharacter {
  /// URL de la imagen que se mostrará en la celda del GridView.
  /// Puede ser una URL de red (http://...) o una ruta de asset local (assets/...).
  final String gridImageUrl;

  /// El primer nombre del personaje.
  final String firstName;

  /// El apellido o apellidos del personaje.
  final String lastName;

  /// Una descripción breve, ideal para un subtítulo en el GridView o una lista.
  final String shortDescription;

  /// La biografía completa para una pantalla de detalle con scroll.
  final String longBio;

  /// Indica si el personaje sigue vivo al final de la Temporada 3.
  /// true = vivo, false = fallecido.
  final bool isAliveInSeason3;

  /// Indica si el personaje posee habilidades sobrenaturales.
  final bool hasPowers;

  // Constructor constante con parámetros nombrados requeridos.
  const StrangerCharacter({
    required this.gridImageUrl,
    required this.firstName,
    required this.lastName,
    required this.shortDescription,
    required this.longBio,
    required this.isAliveInSeason3,
    required this.hasPowers,
  });

  // --- Getters de Utilidad para la UI ---
  // Estos métodos ayudan a formatear los datos para mostrarlos en los widgets
  // sin ensuciar el código de la interfaz.

  /// Retorna el nombre completo concatenado.
  /// Ejemplo: "Eleven Hopper"
  String get fullName => '$firstName $lastName';

  /// Retorna un string amigable para mostrar el estado vital.
  String get statusDisplayLabel => isAliveInSeason3 ? 'Estado: Activo (T3)' : 'Estado: Fallecido';

  /// Retorna un string amigable o un icono para indicar poderes.
  String get powersDisplayLabel => hasPowers ? '⚡ Tiene Poderes' : 'Humano normal';
}

class ThemeUpside {
  static bool upside = false;
}