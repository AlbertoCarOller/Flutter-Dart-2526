import 'package:flutter/material.dart';

class Central extends StatefulWidget {
  const Central({super.key});

  @override
  State<Central> createState() => _CentralState();
}

class _CentralState extends State<Central> {
  // Creamos la clave del formulario
  final _formKey = GlobalKey<FormState>();

  // Creamos el controlador del texto 'Job Title'
  final textControllerJob = TextEditingController();

  // Creamos la varible que va a controlar si es remoto o no
  bool isRemote = false;

  // Varible que controla la selección de flutter
  bool isFlutter = false;

  // Varible que controla la selección de Android
  bool isAndroid = false;

  // Variable que controla la selección de iOS
  bool isIOS = false;

  // Varible que controla los rangos iniciales, NO DEBE SER FINAL, proque entonces no se puede cambiar su rango
  RangeValues _values = RangeValues(20, 30);

  // Contador de experiencias
  int numExperiencias = 0;

  @override
  void initState() {
    super.initState();
    textControllerJob.addListener(() => print(textControllerJob.text));
  }

  @override
  void dispose() {
    textControllerJob.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
        title: Text("Sharing opportunities"),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.only(top: 10),
        child: Form(
          key: _formKey,
          // Columna principal
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              // TextFormField que representa la introducción del título de trabajo
              TextFormField(
                controller: textControllerJob, // -> Controlador del texto
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Hay que introducir un puesto";
                  }
                  return null;
                },
                decoration: InputDecoration(label: Text("Job Title")),
              ),
              // ListTile que representa el switch para saber si es remoto o no
              ListTile(
                // Hacemos un padding para que quede más centrado el contenido
                contentPadding: EdgeInsets.only(top: 5),
                title: Text("Remote"),
                trailing: Switch(
                  value: isRemote,
                  onChanged: (value) => setState(() {
                    isRemote = value;
                  }),
                ),
              ),
              // Linea divisoria horizontal
              Divider(),
              // Representa el texto antes de los checkboxes
              Container(
                padding: EdgeInsets.only(top: 10),
                alignment: Alignment.center, // -> Centramos el texto
                width: double.infinity, // -> Le damos la achura máxima
                child: Text(
                  "Cooding experience in",
                  style: TextStyle(fontSize: 13),
                ),
              ),
              // Llamamos al CheckBox personalizado para cada opción
              CheckBoxPersonalizado(
                subirValor: (newValue) => setState(() {
                  isFlutter =
                      newValue; // -> Cambiamos el valor de la varible por el valor subido
                }),
                nombre: "Flutter",
                valorActual: isFlutter,
              ),
              CheckBoxPersonalizado(
                subirValor: (newValue) => setState(() {
                  isAndroid =
                      newValue; // -> Cambiamos el valor de la varible por el valor subido
                }),
                nombre: "Android",
                valorActual: isAndroid,
              ),
              CheckBoxPersonalizado(
                subirValor: (newValue) => setState(() {
                  isIOS =
                      newValue; // -> Cambiamos el valor de la varible por el valor subido
                }),
                nombre: "IOS",
                valorActual: isIOS,
              ),
              Container(
                padding: EdgeInsets.only(top: 10),
                alignment: Alignment.center,
                width: double.infinity,
                child: Text("Salary", style: TextStyle(fontSize: 13)),
              ),
              RangeSlider(
                values: _values,
                onChanged: (RangeValues values) {
                  // Cambiamos el valor por completo del Rango de valores, por eso no puede ser final
                  setState(() {
                    _values = values;
                  });
                },
                // RangeLabels -> El rango, en este caso se redondea y se muestran como label el valor inicial y final
                labels: RangeLabels(
                  _values.start.round().toString(),
                  _values.end.round().toString(),
                ),
                divisions: 11,
                // Las divisiones del Slider
                max: 110,
                // El máximo valor del Slider
                min: 0, // El mínimo valor del Slider
              ),
              Container(
                padding: EdgeInsets.only(top: 15),
                width: double.infinity,
                alignment: Alignment.center,
                // Botón hacie la última pantalla
                child: ElevatedButton(
                  onPressed: () {
                    // Obtenemos las experiencias del usuario
                    if (_formKey.currentState!.validate()) {
                      // Creamos las divisiones dependiendo de las experiencias que tenga el usuario
                      String separador1 = "";
                      String separador2 = "";
                      numExperiencias = contarExperiencias(
                          isFlutter, isAndroid, isIOS);
                      if (numExperiencias == 0) {
                        separador1 = "No hay experiencia";
                      } else if (numExperiencias == 2) {
                        separador1 = "and";
                      } else if (numExperiencias == 3) {
                        separador1 = ",";
                        separador2 = "and";
                      }
                      // Navegamos a la pantalla final
                      Navigator.pushNamed(
                        context,
                        "/end",
                        // Le pasamos los argumentos necesarios a la pantalla final
                        arguments: [
                          textControllerJob.text,
                          if (isRemote) "100% remote" else "100% presential",
                          "Experience in ${isFlutter ? "Flutter" : ""} "
                              " $separador1 ${isAndroid ? "Android" : ""}"
                              " $separador2 ${isIOS ? "iOS" : ""}",
                              "Salary from ${_values.start.round()}k"
                                  " to ${_values.end.round()}k",
                        ],
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal, // -> Color del botón
                    foregroundColor: Colors.white, // -> Color del texto
                    shape: RoundedRectangleBorder(
                      // -> Para darle forma al botón
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text("Ver detalles"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Esta widget va a crear los CheckBox personalizados
class CheckBoxPersonalizado extends StatelessWidget {
  /* Creamos una función que recibe un
   String y no devuelve nada, esta función cambiará el valor de la varible arriba */
  final void Function(bool) subirValor;
  final String nombre; // -> Título del CheckBox
  final bool valorActual; // -> Valor actual del CheckBox
  const CheckBoxPersonalizado({
    super.key,
    required this.subirValor,
    required this.nombre,
    required this.valorActual,
  });

  @override
  Widget build(BuildContext context) {
    /* CheckboxListTitle permite crear un checkbox mucho más personalizado,
    * poniéndole un título incluso, es como el ListTitle, pero de CheckBox */
    return CheckboxListTile(
      value: valorActual,
      onChanged: (value) {
        //Subimos el valor arriba para cambiarlo en la varible real
        subirValor(value!);
      },
      title: Text(nombre), // -> Nombre que se haya pasado por parámetros
    );
  }
}

/// Esta función va a devolver un entero con el número de experiencias
/// de un usuario
int contarExperiencias(bool isFlutter, bool isAndroid, bool isIOS) {
  int numExperiencias = 0;
  if (isFlutter) {
    numExperiencias++;
  }
  if (isAndroid) {
    numExperiencias++;
  }
  if (isIOS) {
    numExperiencias++;
  }
  return numExperiencias;
}
