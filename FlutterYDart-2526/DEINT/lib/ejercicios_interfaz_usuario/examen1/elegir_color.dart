import 'package:flutter/material.dart';

import 'elemento_data_base.dart';

class ElegirColor extends StatefulWidget {
  const ElegirColor({super.key});

  @override
  State<ElegirColor> createState() => _ElegirColorState();
}

class _ElegirColorState extends State<ElegirColor> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Terrain"),
        centerTitle: true,
        backgroundColor: Colors.purple.shade200,
        actions: [
          IconButton(
            onPressed: () {
              if (ElementoCDataBase.activos() >= 2) {
                Navigator.pushNamed(context, "/mapa");
              }
            },
            icon: Icon(Icons.arrow_right_outlined),
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            spacing: 15,
            children: [
              ElementoCDataBase.activos() >= 2
                  ? Text("Seleccione elementos")
                  : Text(
                      "Debe de seleccionar al menos dos elementos",
                      style: TextStyle(color: Colors.red),
                    ),
              for (ElementoC e in ElementoCDataBase.elementos)
                Container(
                  alignment: Alignment.center,
                  height: 50,
                  color: Colors.grey.shade400,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(width: 50, height: 50, color: e.color),
                          SizedBox(width: 8),
                          Text(
                            e.nombre,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Checkbox(
                        value: e.activo,
                        onChanged: (value) => setState(() {
                          e.activo = value!;
                        }),
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
