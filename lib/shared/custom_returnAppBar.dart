import 'package:ecomove_flutter_mobile/user_management/profile.dart';
import 'package:flutter/material.dart';

class CustomReturnAppBar extends StatelessWidget implements PreferredSizeWidget {
   // Recibir el nombre de usuario

  const CustomReturnAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color(0xFF55889D), // Color de fondo de la AppBar
      elevation: 0, // Sin sombra bajo la AppBar
      automaticallyImplyLeading: true,
      iconTheme: const IconThemeData(color: Colors.white),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

