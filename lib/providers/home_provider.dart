import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeNotifer extends ChangeNotifier {
  int _currentIndex = 0;
  int get currentIndex => _currentIndex;
  void changeIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }
}

final homeProvider = ChangeNotifierProvider<HomeNotifer>((ref) {
  return HomeNotifer();
});