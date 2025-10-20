import 'package:flutter/material.dart';

void main() {
  runApp(ReporteSemanal());
}

class ReporteSemanal extends StatelessWidget {
  const ReporteSemanal({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Reporte Semanal",
      home: Reporte(),
      theme: ThemeData(useMaterial3: true),
    );
  }
}

class Reporte extends StatelessWidget {
  const Reporte({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ejercicio Expanded"),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(10),
          width: 300,
          height: 450,
          color: Colors.grey.shade200,
          // Columna principal
          child: Column(
            children: [
              // Zona de arriba
              Expanded(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Icono y texto
                        Row(
                          children: [
                            Icon(Icons.analytics, color: Colors.blue),
                            Text(
                              "Reporte Semanal",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        // Icono de los 3 puntos
                        Icon(Icons.more_vert),
                      ],
                    ),
                    // Linea divisoria
                    Divider(),
                  ],
                ),
              ),
              // Estructura de en medio
              Expanded(
                flex: 8,
                child: Row(
                  children: [
                    // Primera columna de cuadros azules
                    Expanded(
                      flex: 2,
                      child: Column(
                        children: [
                          // Primer cuadro azul
                          Expanded(child: Container(color: Colors.blue)),
                          // Separación entre cuadros azules
                          SizedBox(height: 10),
                          // Segundo cuadro azul
                          Expanded(
                            child: Container(color: Colors.blue.shade200),
                          ),
                        ],
                      ),
                    ),
                    // Separación entre columnas
                    SizedBox(width: 10),
                    // Segunda columnas de cuadros verdes
                    Expanded(
                      child: Column(
                        children: [
                          // Primer cuadro verde
                          Expanded(
                            flex: 3,
                            child: Container(color: Colors.green.shade200),
                          ),
                          // Separación
                          SizedBox(height: 10),
                          // Segundo cuandro, el más largo
                          Expanded(
                            flex: 7,
                            child: Container(color: Colors.green),
                          ), // Separación
                          SizedBox(height: 10),
                          // Tercer cuadro el más pequeño
                          Expanded(
                            child: Container(color: Colors.green.shade100),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              // Última sección, sección de los botones
              Expanded(
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: ElevatedButton(
                        onPressed: () {
                          print("Ver detalles");
                        },
                        child: Text("Ver detalles"),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: ElevatedButton(
                        onPressed: () {
                          print("Exportar");
                        },
                        child: Text("Exportar"),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
