import 'package:deint/ejercicios_interfaz_usuario/agenda/agenda_data_base.dart';
import 'package:flutter/material.dart';

class Crear extends StatefulWidget {
  const Crear({super.key});

  @override
  State<Crear> createState() => _CrearState();
}

class _CrearState extends State<Crear> {
  final _formKey = GlobalKey<FormState>();
  final _textNombre = TextEditingController();
  final _textNumTelefono = TextEditingController();
  Color? grupoColores;

  @override
  void initState() {
    super.initState();
    _textNombre.addListener(() => print(_textNombre.text));
    _textNumTelefono.addListener(() => print(_textNombre.text));
  }

  @override
  void dispose() {
    _textNombre.dispose();
    _textNumTelefono.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Añadir contacto"),
        centerTitle: true,
        backgroundColor: Colors.yellow.shade100,
      ),
      body: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 50),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 40, vertical: 30),
              child: TextFormField(
                controller: _textNombre,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Se debe de introducir un nombre";
                  }
                  return null;
                },
                decoration: InputDecoration(
                  label: Text("Nombre"),
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: TextFormField(
                keyboardType: TextInputType.numberWithOptions(),
                controller: _textNumTelefono,
                validator: (value) {
                  try {
                    int.parse(value!);
                  } on FormatException {
                    return "Se debe de introducir un número";
                  }
                  return null;
                },
                decoration: InputDecoration(
                  label: Text("Teléfono"),
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 25, vertical: 80),
              child: RadioGroup<Color>(
                onChanged: (value) {
                  setState(() {
                    grupoColores = value;
                  });
                },
                groupValue: grupoColores,
                child: Column(
                  children: [
                    for (MapEntry<String, Color> e
                        in ElementoDataBase.coloresDisponibles.entries)
                      ListTile(
                        title: Text(e.key.toUpperCase()),
                        leading: Radio<Color>(value: e.value),
                      ),
                  ],
                ),
              ),
            ),
            ElevatedButton(
              onPressed: grupoColores != null
                  ? () {
                      if (_formKey.currentState!.validate()) {
                        ElementoDataBase.agregarElemento(
                          Elemento(
                            _textNombre.text,
                            int.parse(_textNumTelefono.text),
                            grupoColores,
                          ),
                        );
                      }
                    }
                  : null,
              child: Text("Guardar"),
            ),
          ],
        ),
      ),
    );
  }
}
