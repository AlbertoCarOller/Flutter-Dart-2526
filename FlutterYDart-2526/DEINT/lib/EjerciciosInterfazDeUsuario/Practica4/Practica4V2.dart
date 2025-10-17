import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(Practica4v2());
}

class Practica4v2 extends StatelessWidget {
  const Practica4v2({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: "Practiva4V2", home: Dado());
  }
}

class Dado extends StatelessWidget {
  const Dado({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: Center(
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              color: Colors.grey,
              height: 150,
              width: 150,
              child: Container(height: 10, width: 10, color: Colors.black),
            ),
            Container(
              color: Colors.white,
              height: 150,
              width: 150,
              padding: EdgeInsets.all(15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(height: 10, width: 10, color: Colors.black),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(height: 10, width: 10, color: Colors.black),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              color: Colors.grey,
              height: 150,
              width: 150,
              padding: EdgeInsets.all(15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(height: 10, width: 10, color: Colors.black),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(height: 10, width: 10, color: Colors.black),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(height: 10, width: 10, color: Colors.black),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              color: Colors.white,
              height: 150,
              width: 150,
              padding: EdgeInsets.all(15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(height: 10, width: 10, color: Colors.black),
                      Container(height: 10, width: 10, color: Colors.black),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(height: 10, width: 10, color: Colors.black),
                      Container(height: 10, width: 10, color: Colors.black),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              color: Colors.grey,
              height: 150,
              width: 150,
              padding: EdgeInsets.all(15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(height: 10, width: 10, color: Colors.black),
                      Container(height: 10, width: 10, color: Colors.black),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(height: 10, width: 10, color: Colors.black),
                    ]
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(height: 10, width: 10, color: Colors.black),
                      Container(height: 10, width: 10, color: Colors.black),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
