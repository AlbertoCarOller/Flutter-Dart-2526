import 'package:flutter/material.dart';

/// Esta clase crea los recursos que serán consumidos y que avisará
/// a las pantallas
class CounterProvider extends ChangeNotifier {
  int _count = 0;
  List<int> _listCounter = [];

  int get count => _count;

  List<int> get listCounter => _listCounter;

  void increment() {
    _count++;
    // Esta función notifica
    notifyListeners();
  }

  void decrement() {
    _count--;
    notifyListeners();
  }

  void reset() {
    _count = 0;
    notifyListeners();
  }

  void addCountToList() {
    listCounter.add(_count);
    reset();
  }

  void incrementCountIndex(int index) {
    _listCounter[index]++;
    notifyListeners();
  }

  void decrementCountIndex(int index) {
    _listCounter[index]--;
    notifyListeners();
  }
}
