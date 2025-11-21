import 'package:deint/ejercicios_interfaz_usuario/examen1/elemento_data_base.dart';
import 'package:flutter/material.dart';

class SizeC extends StatefulWidget {
  const SizeC({super.key});

  @override
  State<SizeC> createState() => _SizeCState();
}

class _SizeCState extends State<SizeC> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, "/elegirColor");
            },
            icon: Icon(Icons.arrow_right_outlined),
          ),
        ],
        title: Text("Size"),
        centerTitle: true,
        backgroundColor: Colors.purple.shade200,
      ),
      body: Form(
        key: _formKey,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 250,
                width: 250,
                child: GridView.builder(
                  itemCount:
                      ElementoCDataBase.elementoSize *
                      ElementoCDataBase.elementoSize,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: ElementoCDataBase.elementoSize,
                    mainAxisSpacing: 2,
                    crossAxisSpacing: 2,
                  ),
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                      ),
                      width: 25,
                      height: 25,
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: Slider(
                  label:
                      "${ElementoCDataBase.elementoSize}x${ElementoCDataBase.elementoSize}",
                  max: 5,
                  min: 3,
                  divisions: 2,
                  value: ElementoCDataBase.elementoSize.toDouble(),
                  onChanged: (value) => setState(() {
                    ElementoCDataBase.elementoSize = value.round();
                  }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
