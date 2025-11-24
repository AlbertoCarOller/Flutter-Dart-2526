import 'package:flutter/material.dart';

class Create extends StatefulWidget {
  const Create({super.key});

  @override
  State<Create> createState() => _CreateState();
}

class _CreateState extends State<Create> {
  int numCrear =  1;
  @override
  Widget build(BuildContext context) {
    Function funcion = ModalRoute.of(context)!.settings.arguments as Function;
    return Scaffold(
      appBar: AppBar(
        title: Text("Create"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("$numCrear", style: TextStyle(fontSize: 150),),
            Padding(
              padding: EdgeInsetsGeometry.only(top: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(onPressed: () {
                    setState(() {
                      numCrear++;
                    });
                  }, child: Text("+")),
                  ElevatedButton(onPressed: () {
                    setState(() {
                      numCrear--;
                    });
                  }, child: Text("-"))
                ],
              ),
            ),
            ElevatedButton(onPressed: () {
              Navigator.pop(context);
              funcion(numCrear);
            }, child: Text("Guardar"))
          ],
        ),
      ),
    );
  }
}
