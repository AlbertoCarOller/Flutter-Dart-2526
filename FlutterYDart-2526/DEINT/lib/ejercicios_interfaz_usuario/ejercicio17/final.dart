import 'package:flutter/material.dart';

class Final extends StatelessWidget {
  const Final({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ModalRoute
          .of(context)
          ?.settings.arguments as Color,
      appBar: AppBar(
        title: Text(
          "Color",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
        ),
        centerTitle: true,
        backgroundColor: Colors.grey.shade500,
      ),
    );
  }
}
