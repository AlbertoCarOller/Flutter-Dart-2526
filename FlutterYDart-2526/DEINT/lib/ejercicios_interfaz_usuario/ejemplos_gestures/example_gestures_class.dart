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

  @override
  Widget build(BuildContext context) {
    return Material(
      child: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return GestureDetector(
            onHorizontalDragStart: (details) {
              _initialDx = details.localPosition.dx;
            },
            onHorizontalDragUpdate: (details) {
              _isRightToLeft = false;
              print(details.delta.dx);
              if(details.delta.dx < 0){
                _isRightToLeft = true;
              }
            },
            onHorizontalDragEnd: (details) {
                if(_isRightToLeft && (_initialDx - details.localPosition.dx).abs() > 200){
                  setState(() { _selectedIndex = index; });
                }
            },
            child: ListTile(
                tileColor: index == _selectedIndex?Colors.grey[200]:Colors.transparent,
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
