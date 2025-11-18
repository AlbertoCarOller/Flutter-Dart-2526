import 'package:deint/bestiario_mistico/bestiario_data.dart';
import 'package:flutter/material.dart';

class CrearBestia extends StatefulWidget {
  const CrearBestia({super.key});

  @override
  State<CrearBestia> createState() => _CrearBestiaState();
}

class _CrearBestiaState extends State<CrearBestia> {
  final _formKey = GlobalKey<FormState>();
  final _textController = TextEditingController();
  Alineamiento? _grupoAlineamiento;
  bool _esHostil = false;
  double _nivelPeligro = 0;

  @override
  void initState() {
    super.initState();
    _textController.addListener(() => print(_textController.text));
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final misArgumentos = ModalRoute.of(context)!.settings.arguments as Function;


    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: Text("Crear bestia"),
        centerTitle: true,
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(
                  left: 10,
                  right: 10,
                  top: 30,
                  bottom: 50,
                ),
                child: TextFormField(
                  decoration: InputDecoration(label: Text("Nombre")),
                  controller: _textController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "No puede estar vacío el nombre";
                    }
                    return null;
                  },
                ),
              ),
              RadioGroup(
                groupValue: _grupoAlineamiento,
                onChanged: (value) {
                  setState(() {
                    _grupoAlineamiento = value;
                  });
                },
                child: Column(
                  children: [
                    for (Alineamiento alineamiento in Alineamiento.values)
                      RadioPersonalizado(valorActual: alineamiento),
                  ],
                ),
              ),
              SizedBox(height: 50),
              SwitchListTile(
                title: Text("¿Es hostil?"),
                value: _esHostil,
                onChanged: (value) => setState(() {
                  _esHostil = value;
                }),
              ),
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.only(left: 10, right: 10, top: 50),
                child: Column(
                  children: [
                    Text("Nivel de peligro"),
                    Slider(
                      label: _nivelPeligro.round().toString(),
                      max: 100,
                      min: 0,
                      divisions: 10,
                      value: _nivelPeligro,
                      onChanged: (value) {
                        setState(() {
                          _nivelPeligro = value;
                        });
                      },
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 50),
                      alignment: Alignment.center,
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: _grupoAlineamiento == null
                            ? null
                            : () {
                                if (_formKey.currentState!.validate()) {
                                  BestiarioDataBase.agregarCriatura(
                                    Criatura(
                                      _textController.text,
                                      _grupoAlineamiento!,
                                      _esHostil,
                                      _nivelPeligro.round(),
                                    ),
                                  );
                                  Navigator.pop(context);
                                  // Una vez se hace pop, se llama seguidamente se llama a la función que va a recargar
                                  misArgumentos();
                                }
                              },
                        child: Text("Guardar"),
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

class RadioPersonalizado extends StatelessWidget {
  final Alineamiento valorActual;

  const RadioPersonalizado({super.key, required this.valorActual});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(valorActual.name.toUpperCase()),
      trailing: Radio<Alineamiento>(value: valorActual),
    );
  }
}
