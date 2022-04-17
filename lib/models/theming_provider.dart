import 'package:flutter/material.dart';

class ThemingProvider extends ChangeNotifier {
  bool _isLightTheme = true;

  void changeTheme() {
    _isLightTheme = !_isLightTheme;
    notifyListeners();
  }

  bool get isLightTheme {
    return _isLightTheme;
  }
}
