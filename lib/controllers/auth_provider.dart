import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  bool isObscure = false;

  void setIsObscure() {
    isObscure = !isObscure;
    notifyListeners();
  }
}
