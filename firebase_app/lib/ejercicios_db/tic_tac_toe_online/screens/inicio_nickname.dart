import 'package:firebase_app/ejercicios_db/tic_tac_toe_online/data/data_singleton.dart';
import 'package:flutter/material.dart';

class InicioNickname extends StatefulWidget {
  const InicioNickname({super.key});

  @override
  State<InicioNickname> createState() => _InicioNicknameState();
}

class _InicioNicknameState extends State<InicioNickname> {
  // Creamos el controller del form
  final _nickController = TextEditingController();

  // Creamos una key para el TextFormField
  final _nicknameKey = GlobalKey<FormFieldState>();

  // Llamamos a la clase singleton (datos)
  DataSingleton data = DataSingleton();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Inicio", semanticsLabel: "Estás en el inicio"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 30, left: 30, bottom: 10),
              child: Card(
                color: Colors.blue.shade300,
                child: TextFormField(
                  //
                  cursorColor: Colors.black,
                  key: _nicknameKey,
                  validator: (value) {
                    if (_nickController.text.isEmpty) {
                      return "El nickname no puede estar vacío";
                    }
                    return null;
                  },
                  controller: _nickController,
                  decoration: InputDecoration(
                    labelStyle: TextStyle(color: Colors.black),
                    icon: Icon(Icons.person, color: Colors.black),
                    border: InputBorder.none,
                    label: Text("Introduce el nickname"),
                  ),
                ),
              ),
            ),
            TextButton(
              style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(Colors.blue.shade300),
                foregroundColor: WidgetStatePropertyAll(Colors.black),
              ),
              onPressed: () {
                if (_nicknameKey.currentState!.validate()) {
                  // Guardamos el nickname pasado por el TextFormField en el atributo de la clase
                  data.nickname = _nickController.text;
                  Navigator.pushNamed(context, "/menu");
                }
              },
              child: Text("Iniciar"),
            ),
          ],
        ),
      ),
    );
  }
}
