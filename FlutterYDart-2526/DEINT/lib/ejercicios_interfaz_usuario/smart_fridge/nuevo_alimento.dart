import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NuevoAlimento extends StatefulWidget {
  const NuevoAlimento({super.key});

  @override
  State<NuevoAlimento> createState() => _NuevoAlimentoState();
}

class _NuevoAlimentoState extends State<NuevoAlimento> {
  // Creamos la key del formulario
  final _formKey = GlobalKey<FormState>();

  // Creamos el controlador del TextFormField del nombre del alimento
  final _textControllerName = TextEditingController();

  @override
  void initState() {
    super.initState();
    _textControllerName.addListener(() => print(_textControllerName.text));
  }

  @override
  void dispose() {
    _textControllerName.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Crear nuevo alimento")),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsetsGeometry.symmetric(
                horizontal: 50,
                vertical: 10,
              ),
              child: Card(
                color: Colors.teal.shade200,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: TextFormField(
                    controller: _textControllerName,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      label: Text(
                        "Nombre alimento",
                        style: GoogleFonts.outfit(),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
