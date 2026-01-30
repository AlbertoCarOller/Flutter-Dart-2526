class LogicaJuego {
  static const int VACIO = 0;
  static const int JUGADOR_1 = 1;
  static const int JUGADOR_2 = 2;
  static const int TAMANO_TABLERO = 9; // 8x8
  static const int LINEA_PARA_GANAR = 3; // Cambiar a 3 si quieres que sea más fácil

  // --- 1. VALIDACIÓN (Igual que antes) ---
  static bool esMovimientoValido({
    required int posicion,
    required List<dynamic> tableroActual,
    required bool esMiTurno,
  }) {
    if (!esMiTurno) return false;
    if (posicion < 0 || posicion >= TAMANO_TABLERO) return false;
    if (tableroActual[posicion] != VACIO) return false;
    return true;
  }

  // --- 2. PREPARAR DATOS (Actualizado para incluir ganador) ---
  static Map<String, dynamic> prepararDatosDeJugada({
    required int posicion,
    required List<dynamic> tableroActual,
    required int miNumeroJugador,
    required String nicknameOponente,
    required String miNickname,
  }) {
    List<int> nuevoTablero = List<int>.from(tableroActual);
    nuevoTablero[posicion] = miNumeroJugador;

    // Verificamos si este movimiento ha ganado la partida
    int ganadorId = comprobarGanador(nuevoTablero);
    bool hayEmpate = false;

    // Si nadie ganó, miramos si el tablero está lleno
    if (ganadorId == 0 && !nuevoTablero.contains(VACIO)) {
      hayEmpate = true;
    }

    // Preparamos el mapa base
    Map<String, dynamic> datos = {
      "tablero": nuevoTablero,
    };

    if (ganadorId != 0) {
      // CASO 1: HAY VICTORIA
      datos["estado"] = "terminado";
      datos["ganador"] = miNickname; // Yo gané
      datos["turno"] = ""; // Ya no hay turno
    } else if (hayEmpate) {
      // CASO 2: EMPATE
      datos["estado"] = "terminado";
      datos["ganador"] = "EMPATE";
      datos["turno"] = "";
    } else {
      // CASO 3: SIGUE EL JUEGO
      datos["turno"] = nicknameOponente; // Paso el turno
    }

    return datos;
  }

  // --- 3. ALGORITMO DE VICTORIA (La parte matemática compleja) ---
  // Devuelve: 0 (nadie gana), 1 (gana J1), 2 (gana J2)
  /*static int comprobarGanador(List<int> tablero) {
    // Recorremos cada celda del tablero
    for (int i = 0; i < TAMANO_TABLERO; i++) {
      int ficha = tablero[i];
      if (ficha == VACIO) continue; // Si está vacía, saltamos

      // Convertimos índice lineal a coordenadas (fila, col)
      int fila = (i / 8).floor();
      int col = i % 8;

      // Revisamos las 4 direcciones posibles desde esta ficha:
      // 1. Horizontal hacia la derecha
      if (col + LINEA_PARA_GANAR <= 8 &&
          _checkLinea(tablero, i, 1)) return ficha;

      // 2. Vertical hacia abajo
      if (fila + LINEA_PARA_GANAR <= 8 &&
          _checkLinea(tablero, i, 8)) return ficha;

      // 3. Diagonal descendente (\)
      if (col + LINEA_PARA_GANAR <= 8 &&
          fila + LINEA_PARA_GANAR <= 8 &&
          _checkLinea(tablero, i, 9)) return ficha;

      // 4. Diagonal ascendente (/)
      if (col - (LINEA_PARA_GANAR - 1) >= 0 &&
          fila + LINEA_PARA_GANAR <= 8 &&
          _checkLinea(tablero, i, 7)) return ficha;
    }

    return 0; // Nadie ha ganado aún
  }*/

  // --- 3. ALGORITMO DE VICTORIA (Adaptado a 3x3) ---
  static int comprobarGanador(List<int> tablero) {
    // Definimos el ancho real del tablero para cálculos
    const int ANCHO = 3; // CAMBIO: Antes era implícitamente 8

    for (int i = 0; i < TAMANO_TABLERO; i++) {
      int ficha = tablero[i];
      if (ficha == VACIO) continue;

      // Convertimos índice lineal a coordenadas (fila, col)
      // CAMBIO: Dividimos y modulamos por 3 (ANCHO), no por 8
      int fila = (i / ANCHO).floor();
      int col = i % ANCHO;

      // 1. Horizontal hacia la derecha
      // CAMBIO: Comparamos contra 3 (ANCHO)
      if (col + LINEA_PARA_GANAR <= ANCHO &&
          _checkLinea(tablero, i, 1)) return ficha;

      // 2. Vertical hacia abajo
      // CAMBIO: Comparamos contra 3 y el salto es de 3
      if (fila + LINEA_PARA_GANAR <= ANCHO &&
          _checkLinea(tablero, i, 3)) return ficha;

      // 3. Diagonal descendente (\)
      // CAMBIO: Límites contra 3 y el salto es 4 (ANCHO + 1)
      // Por qué 4? Porque 0 -> 4 -> 8 es la diagonal
      if (col + LINEA_PARA_GANAR <= ANCHO &&
          fila + LINEA_PARA_GANAR <= ANCHO &&
          _checkLinea(tablero, i, 4)) return ficha;

      // 4. Diagonal ascendente (/)
      // CAMBIO: Límites contra 3 y el salto es 2 (ANCHO - 1)
      // Por qué 2? Porque 2 -> 4 -> 6 es la diagonal inversa
      if (col - (LINEA_PARA_GANAR - 1) >= 0 &&
          fila + LINEA_PARA_GANAR <= ANCHO &&
          _checkLinea(tablero, i, 2)) return ficha;
    }

    return 0;
  }

  // Helper privado para verificar una línea específica
  // salto: 1 (horizontal), 8 (vertical), 9 (diag \), 7 (diag /)
  static bool _checkLinea(List<int> tablero, int inicio, int salto) {
    int fichaJugador = tablero[inicio];
    for (int k = 1; k < LINEA_PARA_GANAR; k++) {
      if (tablero[inicio + (k * salto)] != fichaJugador) {
        return false;
      }
    }
    return true;
  }
}