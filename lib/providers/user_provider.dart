import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  String _username = '';
  int _userId = 0; // Inicializa el userId en 0 o como prefieras

  String get username => _username;
  int get userId => _userId;

  void setUsername(String username) {
    _username = username;
    notifyListeners();
  }

  void setUserId(int userId) {
    _userId = userId;
    notifyListeners();
  }
}
