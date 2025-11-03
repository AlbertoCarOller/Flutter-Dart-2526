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
  // TODO: añadir un controlador en vez de el onChanged

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
        child: ListaCuerpo(),
      ),
    );
  }
}

class ListaCuerpo extends StatelessWidget {
  const ListaCuerpo({super.key});

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
                // validator -> Lambda que nos permite validar el campo, OJO, debe llamarse a la validación
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "El campo es obligatorio";
                  }
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
                onChanged: (value) => print("Valor: $value"),
              );
      },
      separatorBuilder: (context, index) => Divider(),
      itemCount: 50,
    );
  }
}
