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
          child: Column(
            children: [
              // Zona de arriba
              Expanded(
                child: Row(
                  children: [
                    // Icono y texto
                    Row(
                      children: [
                        Icon(Icons.analytics, color: Colors.blue,),
                        Text("Reporte Semanal")
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

