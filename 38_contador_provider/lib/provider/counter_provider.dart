import 'package:flutter/material.dart';

class CounterProvider with ChangeNotifier {

  int _counter = 0;

  // Método getter
  int get counter => _counter; // método para poder obtener la variable local 

  // Método setter
  void increment() {
    _counter++;
    notifyListeners(); // notificar a los listeners, a los widgets que están escuchando nuestro get
  }

  void decrement() {
    if(_counter>0) {_counter--;} else {_counter=0;}
    notifyListeners();
  }

  void duplicatebytwo() {
    _counter *= 2;
    notifyListeners();
  }
}