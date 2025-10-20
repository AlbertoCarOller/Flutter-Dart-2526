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
      body: ListView.separated(
          itemBuilder: (context, index) {
            return Text("$index");
          },
          separatorBuilder: (context, index) {
            return Divider(
              color: (index % 2 == 0) ? Colors.blue : Colors.white, // TODO: solcuionar lineas blancas
            );
          },
          itemCount: 100),
    );
  }
}
