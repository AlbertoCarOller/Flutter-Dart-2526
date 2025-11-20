import 'package:deint/ejercicios_interfaz_usuario/filtro_hoteles/hotel_data_base.dart';
import 'package:flutter/material.dart';

class Filtro extends StatefulWidget {
  const Filtro({super.key});

  @override
  State<Filtro> createState() => _FiltroState();
}

class _FiltroState extends State<Filtro> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown.shade100,
      appBar: AppBar(title: Text("Filtro de hotel"), centerTitle: true),
      body: Form(
        key: _formKey,
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
          child: Column(
            children: [
              Column(
                children: [
                  Text("Rango de precios"),
                  RangeSlider(
                    labels: RangeLabels(
                      FiltroHotel.rangoPrecios.start.round().toString(),
                      FiltroHotel.rangoPrecios.end.round().toString(),
                    ),
                    max: 500,
                    min: 0,
                    divisions: 20,
                    values: FiltroHotel.rangoPrecios,
                    onChanged: (value) {
                      setState(() {
                        FiltroHotel.rangoPrecios = value;
                      });
                    },
                  ),
                ],
              ),
              for (MapEntry<String, bool> e in FiltroHotel.extras.entries)
                CheckboxListTile(
                  value: e.value,
                  onChanged: (value) {
                    setState(() {
                      FiltroHotel.extras[e.key] = value!;
                    });
                  },
                  title: Text(e.key.toUpperCase()),
                ),
              SizedBox(height: 10),
              Divider(color: Colors.white, height: 10),
              SizedBox(height: 10),
              RadioGroup<Categoria>(
                onChanged: (value) {
                  setState(() {
                    FiltroHotel.categoria = value;
                  });
                },
                groupValue: FiltroHotel.categoria,
                child: Column(
                  children: [
                    for (Categoria categoria in Categoria.values)
                      ListTile(
                        title: Text(categoria.name.toUpperCase()),
                        trailing: Radio<Categoria>(value: categoria),
                      ),
                  ],
                ),
              ),
              ElevatedButton(onPressed: () {
              }, child: Text("Guardar"))
            ],
          ),
        ),
      ),
    );
  }
}
