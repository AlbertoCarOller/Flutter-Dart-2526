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
      appBar: AppBar(title: Text("Inicio")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 30, left: 30, bottom: 10),
              child: Card(
                color: Colors.blue.shade100,
                child: TextFormField(
                  cursorColor: Colors.blue.shade400,
                  key: _nicknameKey,
                  validator: (value) {
                    if (_nickController.text.isEmpty) {
                      return "El nickname no puede estar vacío";
                    }
                    return null;
                  },
                  controller: _nickController,
                  decoration: InputDecoration(
                    labelStyle: TextStyle(color: Colors.blue.shade400),
                    icon: Icon(Icons.person, color: Colors.blue.shade400),
                    border: InputBorder.none,
                    label: Text("Introduce el nickname"),
                  ),
                ),
              ),
            ),
            TextButton(
              style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(Colors.blue.shade400),
                foregroundColor: WidgetStatePropertyAll(Colors.white),
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
