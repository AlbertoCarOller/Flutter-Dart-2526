import 'package:deint/ejercicios_interfaz_usuario/registro_gastos_viaje/gasto_data_base.dart';
import 'package:flutter/material.dart';

class CrearGasto extends StatefulWidget {
  const CrearGasto({super.key});

  @override
  State<CrearGasto> createState() => _CrearGastoState();
}

class _CrearGastoState extends State<CrearGasto> {
  final _formKey = GlobalKey<FormState>();
  final _textConcepto = TextEditingController();
  final _textMonto = TextEditingController();
  String? grupoValores;

  @override
  void initState() {
    super.initState();
    _textConcepto.addListener(() => print(_textConcepto.text));
    _textMonto.addListener(() => print(_textMonto.text));
  }

  @override
  void dispose() {
    _textConcepto.dispose();
    _textMonto.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Crear gasto"),
        centerTitle: true,
        backgroundColor: Colors.green.shade200,
      ),
      body: Form(
        key: _formKey,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 50, vertical: 30),
          child: Column(
            children: [
              TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Se debe de introducir un concepto";
                  }
                  return null;
                },
                controller: _textConcepto,
                decoration: InputDecoration(
                  label: Text("Nombre del concepto"),
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 30),
              TextFormField(
                validator: (value) {
                  try {
                    double.parse(value!);
                  } on FormatException {
                    return "Se debe de introducir un monto válido";
                  }
                  return null;
                },
                controller: _textMonto,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text("Monto"),
                ),
              ),
              SizedBox(height: 40),
              RadioGroup<String>(
                groupValue: grupoValores,
                onChanged: (value) {
                  setState(() {
                    grupoValores = value;
                  });
                },
                child: Column(
                  children: [
                    for (String s in GastoDataBase.categoriasDisponibles.keys)
                      ListTile(
                        title: Text(s.toUpperCase()),
                        leading: Radio<String>(value: s),
                      ),
                  ],
                ),
              ),
              SizedBox(height: 40),
              ElevatedButton(
                onPressed: grupoValores != null
                    ? () {
                        if (_formKey.currentState!.validate()) {
                          GastoDataBase.agregarGasto(
                            Gasto(
                              _textConcepto.text,
                              double.parse(_textMonto.text),
                              grupoValores!,
                            ),
                          );
                          /* Sirve para mostrar un mensaje de una acción al usuario,
                          * NO SE DEBE DE UTILIZAR PARA VALIDACIONES */
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              duration: Duration(seconds: 2),
                              backgroundColor: Colors.green,
                              content: Text(
                                "Se ha registrado correctamente el gasto '${_textConcepto.text}'",
                              ),
                            ),
                          );
                        }
                      }
                    : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green.shade50,
                  foregroundColor: Colors.orangeAccent.shade400,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusGeometry.all(Radius.circular(8)),
                  ),
                ),
                child: Text("Guardar"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
