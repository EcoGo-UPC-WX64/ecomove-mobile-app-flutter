import 'package:ecomove_flutter_mobile/user_management/profile.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EcoMove',
      theme: ThemeData(
        primaryColor: Colors.blueGrey,
      ),
      home: ProfilePage(),
    );
  }
}
