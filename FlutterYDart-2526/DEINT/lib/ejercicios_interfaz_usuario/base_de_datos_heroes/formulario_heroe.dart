import 'package:deint/ejercicios_interfaz_usuario/base_de_datos_heroes/heroe_data.dart';
import 'package:flutter/material.dart';

class FormularioHeroe extends StatefulWidget {
  const FormularioHeroe({super.key});

  @override
  State<FormularioHeroe> createState() => _FormularioHeroeState();
}

class _FormularioHeroeState extends State<FormularioHeroe> {
  // Creamos la key del formulario
  final _formKey = GlobalKey<FormState>();

  /* Creamos el controlador del scroll, este sirve para saber la posición del scroll,
   movel hacia una posición exacta, etc. */
  final _scrollController = ScrollController();

  // Controlador del nombre (TextFormField)
  final _nombreController = TextEditingController();

  // Grupo de valores del enum
  Poder _radioPoderes = Poder.fuerza;

  // Variable que controla si es aliado o no (SwitchListTile)
  bool esAliado = false;

  // Variable que va a controlar el nivel (Slider)
  double nivel = 1;

  // Hacemos los bloques del TextController
  @override
  void initState() {
    super.initState();
    _nombreController.addListener(() => print(_nombreController.text));
  }

  @override
  void dispose() {
    _nombreController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade400,
      appBar: AppBar(title: Text("Creación de personaje"), centerTitle: true),
      // Creamos el formulario
      body: Form(
        key: _formKey,
        /* Consta de una columna, que va a contener todos los elementos del formulario
         para la creación del personaje */
        child: SingleChildScrollView(
          controller: _scrollController,
          child: Column(
            children: [
              // Creamos el TextFormField para introducir el nombre del personaje
              Container(
                padding: EdgeInsets.only(left: 10, right: 10, top: 10),
                child: TextFormField(
                  controller: _nombreController,
                  decoration: InputDecoration(label: Text("Nombre")),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Se debe de ingresar un nombre de personaje";
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(height: 60),
              // Elección del poder (RadioListTile), está deprecado, mejor RadioGroup
              /*for (var poder in Poder.values)
                RadioPersonalizado(
                  grupoValores: _radioPoderes,
                  valorActual: poder,
                  subirValor: (newValor) => setState(() {
                    _radioPoderes = newValor;
                  }),
                ),*/
              // Lo hacemos con el que no está deprecado
              RadioGroup<Poder>(
                onChanged: (value) {
                  setState(() {
                    _radioPoderes = value!;
                  });
                },
                groupValue: _radioPoderes,
                child: Column(
                  children: [
                    for (var poder in Poder.values)
                      ListTitlePersonalizado(
                        valorActual: poder,
                        grupoValores: _radioPoderes,
                      ),
                  ],
                ),
              ),
              SizedBox(height: 60),
              // Si es aliado o no (SwitchListTile)
              SwitchListTile(
                value: esAliado,
                onChanged: (value) {
                  setState(() {
                    esAliado = value;
                  });
                },
                title: Text("¿Es aliado?"),
              ),
              // Slider para controlar el nivel del personaje
              Container(
                padding: EdgeInsets.only(left: 10, right: 10, top: 60),
                child: Slider(
                  value: nivel,
                  onChanged: (value) => setState(() {
                    nivel = value;
                  }),
                  min: 1,
                  max: 100,
                  divisions: 100,
                  label: nivel.round().toString(),
                ),
              ),
              // Botón para guardar el personaje
              Container(
                padding: EdgeInsets.all(60),
                alignment: Alignment.center,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // Guardamos en la lista al personaje
                      HeroeDatabase.addHeroe(
                        Heroe(
                          nombre: _nombreController.text,
                          poder: _radioPoderes,
                          esAliado: esAliado,
                          nivel: nivel.round(),
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

/*
/// Es un radio personalizado, le pasamos el valor
/// actual que corresponderá a la iteración actual,
/// el nombre será el valor actual .toString, se le
/// pasa una función de subida
class RadioPersonalizado extends StatelessWidget {
  // Grupo de valores
  final Poder grupoValores;

  // El valor actual
  final Poder valorActual;

  // Esta función va a cambiar el valor real
  final void Function(Poder) subirValor;

  const RadioPersonalizado({
    super.key,
    required this.grupoValores,
    required this.valorActual,
    required this.subirValor,
  });

  @override
  Widget build(BuildContext context) {
    return RadioListTile<Poder>(
      title: Text(valorActual.name.toUpperCase()),
      value: valorActual,
      groupValue: grupoValores,
      onChanged: (value) {
        subirValor(value!);
      },
    );
  }
}*/

class ListTitlePersonalizado extends StatelessWidget {
  final Poder valorActual;
  final Poder grupoValores;

  const ListTitlePersonalizado({
    super.key,
    required this.valorActual,
    required this.grupoValores,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(valorActual.name.toUpperCase()),
      leading: Radio<Poder>(value: valorActual),
    );
  }
}
