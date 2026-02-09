import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:prueba_provider/providers/counter_provider.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: context.read<CounterProvider>().listCounter.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(
              // El watch está siempre observando los cambios, cambia el build por completo
              "${context.watch<CounterProvider>().listCounter.elementAt(index)}",
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  onPressed: () => context
                      .read<CounterProvider>()
                      .incrementCountIndex(index),
                  icon: Icon(Icons.add),
                ),
                IconButton(
                  onPressed: () => context
                      .read<CounterProvider>()
                      .decrementCountIndex(index),
                  icon: Icon(Icons.remove),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
