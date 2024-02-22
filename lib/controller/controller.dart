import 'package:flutter/material.dart';

class NumberListProvider extends ChangeNotifier {
  List<int> nums = [1, 2, 3, 4];
  add() {
    nums.add(nums.last + 1);
    notifyListeners();
  }

  remove() {
    nums.removeLast();
    notifyListeners();
  }
}
