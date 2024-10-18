import 'package:flutter/material.dart';
import 'package:ecomove_flutter_mobile/user_management/blog.dart';
import 'package:ecomove_flutter_mobile/user_management/memberships.dart';
import 'package:ecomove_flutter_mobile/user_management/profile.dart';
import 'package:ecomove_flutter_mobile/user_management/publish_blog.dart';
import 'package:ecomove_flutter_mobile/user_management/achievements.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.blueGrey,
      ),
      home: const ProfilePage(),
    );
  }
}

