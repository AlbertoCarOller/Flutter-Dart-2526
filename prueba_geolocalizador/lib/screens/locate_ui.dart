import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class LocateUi extends StatelessWidget {
  const LocateUi({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("My location is: ${getLocation().then((value) => value,).toString()}")),
    );
  }
}

Future<Position> getLocation() async {
  return await Geolocator.getCurrentPosition(
    desiredAccuracy: LocationAccuracy.high,
  ).then((value) => value,);
}
