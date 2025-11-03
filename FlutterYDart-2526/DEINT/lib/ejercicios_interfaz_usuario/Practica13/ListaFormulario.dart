import 'package:flutter/material.dart';

void main() {
  runApp(Formulario());
}

class Formulario extends StatelessWidget {
  const Formulario({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Formulario",
      home: Lista(),
      theme: ThemeData(useMaterial3: true),
    );
  }
}

class Lista extends StatefulWidget {
  const Lista({super.key});

  @override
  State<Lista> createState() => _ListaState();
}

class _ListaState extends State<Lista> {
  /* La clave del formulario, esta clave nos permitirá acceder al formulario en
   cualquier lugar de la jerrarquía de árbol, este funciona como un control
    remoto del formulario, es decir puedes acceder a funciones del formulario,
    como validaciones y demás estando fuera de 'Form'*/
  final _formKey = GlobalKey<FormState>();

  /* Creamos el controlador, este controlador sirve para controlar un campo
  * de texto, necesita un listener para escuchar los cambios, te permite también
  * modificar el texto desde fuera, por ejemplo si quiero un botón para eliminarlo,
  * además mantiene el valor, no se destruye al hacer scroll. Las ListView destuyen
  * el contenido al hacer scroll y después lo reconstruye, guardándolo a este
  * nivel no se destruyen porque no está dentro de la ListView, en caso de que
  * usara onChanged como está dentro sí se destruiría aparte de que el
  * TextFormField sabe que tiene el controlador asociado, y sabe mantener el texto*/
  final _textController = TextEditingController();

  /* El bloque initState es el bloque donde se debe de añadir el listener al
   controlador para que pueda escuchar los cambios, es como el constructor */
  @override
  void initState() {
    super.initState();
    // Añadimos el listener, esta función se ejecutará cada vez que el texto cambie
    _textController.addListener(
      // .text -> Con esto obtenemos el texto actual, en este caso solo imprimos en consola
      () => print(_textController.text),
    );
  }

  /* Este bloque de código es necesario para hacer el .dispose, esto es
  * necesario para que el controlador sea eliminado y no se quede abierto
  * y ocupe memoria */
  @override
  void dispose() {
    // Se destruye cuando no se utiliza, es decir hay un cambio de pantalla y demás
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /* Form es el widget principal para la creación de un formulario,
       todo lo que este debajo de este será parte del formulario */
      body: Form(
        // Se autovalidará el formulario con las interacciones del usuario
        autovalidateMode: AutovalidateMode.onUserInteraction,
        // Le asignamos al formulario la clave generada para este
        key: _formKey,
        child: ListaCuerpo(textController: _textController),
      ),
    );
  }
}

class ListaCuerpo extends StatelessWidget {
  // Los widget cuando reciben parámetros, esos parámetros no pueden ser privados
  final TextEditingController textController;

  const ListaCuerpo({super.key, required this.textController});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) {
        return (index != 29)
            // Container para darle una altura de 30
            ? Container(
                height: 30,
                alignment: Alignment.center,
                child: ListTile(leading: Text("${index + 1}")),
              )
            // Creamos el TextFormField para rellenar el campo
            : TextFormField(
                // Pasamos el controlador
                controller: textController,
                // validator -> Lambda que nos permite validar el campo, OJO, debe llamarse a la validación
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "El campo es obligatorio";
                  }
                  // En caso de que no haya errores devuelve null
                  return null;
                },
                // InputDecoration para poder editarlo
                decoration: InputDecoration(
                  // label es el texto flotante que aparece arriba
                  label: Text("Nombre"),
                  // hintText texto que aparece donde escribir a modo de ayuda
                  hintText: "Introduce tu nombre aquí",
                  // Icono de decoración
                  icon: Icon(Icons.person),
                ),
                // onChanged hace algo cuando cambia el valor
                //onChanged: (value) => print("Valor: $value"), -> Ya no es necesario con el controlador
              );
      },
      separatorBuilder: (context, index) => Divider(),
      itemCount: 50,
    );
  }
}
