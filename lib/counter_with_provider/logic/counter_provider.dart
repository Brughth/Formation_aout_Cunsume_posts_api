import 'package:flutter/cupertino.dart';

class CounterProvider extends ChangeNotifier {
  int count;
  CounterProvider({
    required this.count,
  });
  int get getcount => count;

  increment() {
    count++;
    notifyListeners();
  }

  decrement() {
    count--;
    notifyListeners();
  }
}
