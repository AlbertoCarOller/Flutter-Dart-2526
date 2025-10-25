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
      body: SizedBox(
        width: 700,
        child: ListView.separated(
          // Para hacer scroll horizontalmente
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            // Crear ListTile te permite una lista con información dentro
            return (index % 2 == 0 && index != 0) ? SizedBox(width: 200, child: ListTile(title: Text("$index"),),) : SizedBox.shrink();
          },
          separatorBuilder: (context, index) {
            return (index % 2 == 0 && index != 0)
            // VerticalDivider -> Como el divider pero vertical
                ? VerticalDivider(color: Colors.blue, thickness: 5,)
                /* SizedBox.shrink() -> Crea un SizeBox con el mínimo tamaño posible,
                  aunque en este caso podríamos poner SizeBox, ya que está dentro de
                  un ListViw.separated() y obliga al sizebox a ser pequeña, que es su padre, */
                : SizedBox.shrink();
          },
          itemCount: 101,
        ),
      ),
    );
  }
}
