import 'package:flutter/material.dart';

class CrearBestia extends StatefulWidget {
  const CrearBestia({super.key});

  @override
  State<CrearBestia> createState() => _CrearBestiaState();
}

class _CrearBestiaState extends State<CrearBestia> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.cyan,
      title: Text("Crear bestia"), centerTitle: true,),
    );
  }
}
