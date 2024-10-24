import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  String _username = ''; // Username inicial vacío

  String get username => _username; // Getter para el username

  void setUsername(String username) {
    _username = username; // Actualiza el username
    notifyListeners(); // Notifica a los listeners del cambio
  }
}
