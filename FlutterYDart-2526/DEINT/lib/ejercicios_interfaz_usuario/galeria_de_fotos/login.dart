import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  final _textUsername = TextEditingController();
  final _textPassword = TextEditingController();

  @override
  void initState() {
    super.initState();
    _textUsername.addListener(() => print(_textUsername.text));
    _textPassword.addListener(() => print(_textPassword.text));
  }

  @override
  void dispose() {
    _textUsername.dispose();
    _textPassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login", style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      backgroundColor: Colors.brown.shade300,
      body: Form(
        key: _formKey,
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(horizontal: 70),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                decoration: InputDecoration(
                  label: Text("Username"),
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Se debe de introducir un username";
                  }
                  return null;
                },
                controller: _textPassword,
              ),
              SizedBox(height: 40),
              TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                  label: Text("Password"),
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value!.isEmpty || value.length < 8) {
                    return "Se debe de introducir una contraseña con al menos 8 caracteres";
                  }
                  return null;
                },
                controller: _textUsername,
              ),
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Navigator.pushNamed(context, "/galeria");
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey.shade400,
                  foregroundColor: Colors.brown,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusGeometry.all(Radius.circular(5)),
                  ),
                ),
                child: Text("Iniciar"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
