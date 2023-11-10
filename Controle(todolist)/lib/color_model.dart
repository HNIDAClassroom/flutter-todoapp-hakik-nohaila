import 'package:flutter/material.dart';

class ColorModel with ChangeNotifier {
  Color _backgroundColor = Colors.blue; // Initial background color

  Color get backgroundColor => _backgroundColor;

  void changeBackgroundColor(Color color) {
    _backgroundColor = color;
    notifyListeners();
  }

  void toggleBackgroundColor() {
    if (_backgroundColor == Colors.blue) {
      changeBackgroundColor(Colors.purple);
    } else {
      changeBackgroundColor(Colors.blue);
    }
  }
}
