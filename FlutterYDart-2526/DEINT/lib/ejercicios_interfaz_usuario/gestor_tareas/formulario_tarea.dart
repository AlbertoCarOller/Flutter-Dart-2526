import 'package:deint/ejercicios_interfaz_usuario/gestor_tareas/tarea.dart';
import 'package:flutter/material.dart';

class FormularioTarea extends StatefulWidget {
  const FormularioTarea({super.key});

  @override
  State<FormularioTarea> createState() => _FormularioTareaState();
}

class _FormularioTareaState extends State<FormularioTarea> {
  final _formkey = GlobalKey<FormState>(); // -> Clave del formulario
  final _scrollState = ScrollController(); // -> Controlador del scroll
  final _descripcionController =
      TextEditingController(); // -> Controlador del TextField de descripción
  Prioridad _valoresPrioridad =
      Prioridad.media; // -> Creamos el grupo de valores de 'Prioriad'

  @override
  void initState() {
    super.initState();
    _descripcionController.addListener(
      () => print(_descripcionController.text),
    );
  }

  @override
  void dispose() {
    _descripcionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal.shade200,
      appBar: AppBar(title: Text("Crear tarea"), centerTitle: true),
      body: Form(
        key: _formkey,
        child: SingleChildScrollView(
          controller: _scrollState,
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(
                  right: 20,
                  left: 20,
                  top: 50,
                  bottom: 50,
                ),
                child: TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) return "Descripción requerida";
                    return null;
                  },
                  decoration: InputDecoration(
                    label: Text("Descripción"),
                    border: OutlineInputBorder(),
                  ),
                  controller: _descripcionController,
                ),
              ),
              RadioGroup<Prioridad>(
                onChanged: (value) {
                  setState(() {
                    _valoresPrioridad = value!;
                  });
                },
                groupValue: _valoresPrioridad,
                child: Column(
                  children: [
                    for (Prioridad prioridad in Prioridad.values)
                      RadioPersonalizado(valorActual: prioridad),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 50),
                alignment: Alignment.center,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (_formkey.currentState!.validate()) {
                      TareaDatabase.addTarea(
                        Tarea(
                          _descripcionController.text,
                          _valoresPrioridad,
                          false,
                        ),
                      );
                      Navigator.pop(context);
                    }
                  },
                  child: Text("Guardar"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Esta función va a generar los RadioButtons personalizados
class RadioPersonalizado extends StatelessWidget {
  final Prioridad valorActual;

  const RadioPersonalizado({super.key, required this.valorActual});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(valorActual.name.toUpperCase()),
      trailing: Radio<Prioridad>(value: valorActual),
    );
  }
}
