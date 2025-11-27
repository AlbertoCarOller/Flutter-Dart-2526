import 'package:flutter/material.dart';

class ExampleGesturesClass extends StatefulWidget {
  const ExampleGesturesClass({super.key});

  @override
  State<ExampleGesturesClass> createState() => _ExampleGesturesClassState();
}

class _ExampleGesturesClassState extends State<ExampleGesturesClass> {
  int? _selectedIndex;
  bool _isRightToLeft = false;
  double _initialDx = 0.0;

  List<int> items = List<int>.generate(10, (index) => index,);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Dismissible(
            key: ValueKey<int>(items[index]),
            onDismissed: (direction) {
              setState(() {
                items.removeAt(index);
              });
            },
            direction: DismissDirection.endToStart,
            background: Container(color: Colors.red,
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(right: 15),
              child: Icon(Icons.delete_forever),
            ),
            secondaryBackground: Container(color: Colors.green,
                alignment: Alignment.center,
                padding: EdgeInsets.only(right: 15),
                child: Icon(Icons.access_alarm),),
            child: ListTile(
                title: Text(
                  '$index',
                  style: Theme.of(context).textTheme.headlineMedium ,
                )),
          );
        },
      ),
    );
  }
}
