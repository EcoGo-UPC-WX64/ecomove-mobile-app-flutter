import 'package:ecomove_flutter_mobile/booking_reservation/reserva.dart';
import 'package:ecomove_flutter_mobile/user_management/memberships.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback onMenuPressed;

  const CustomAppBar({
    Key? key,
    required this.onMenuPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color(0xFF55889D), // Color del AppBar
      elevation: 0,
      leading: IconButton(
        icon: const Icon(Icons.menu, color: Colors.white),
        onPressed: () {
          onMenuPressed();
        },

      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.account_circle, color: Colors.white),
          onPressed: () {
            // Funcionalidad del botón de perfil
          },
        ),
      ],
    );
  }

  // Drawer personalizado con tu lista
  static Widget buildDrawer(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Color(0xFF55889D), // Color de fondo del header
            ),
            child: Text(
              'Menú',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          _buildDrawerItem(
            context,
            icon: Icons.home,
            text: 'Inicio',
            onTap: () {
              Navigator.pop(context); // Acción para "Inicio"
            },
          ),
          _buildDrawerItem(
            context,
            icon: Icons.subscriptions,
            text: 'Suscripciones',
            onTap: () {
              Navigator.pop(context); // Cierra el Drawer antes de navegar
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SuscripcionesPage()), // Navega a la nueva página
              );
            },
          ),
          _buildDrawerItem(
            context,
            icon: Icons.directions_bike,
            text: 'Vehículos',
            onTap: () {
              Navigator.pop(context); // Acción para "Vehículos"
            },
          ),
          _buildDrawerItem(
            context,
            icon: Icons.calendar_today,
            text: 'Reservar',
            onTap: () {
              Navigator.pop(context); // Acción para "Reservar"
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ReservaPage()), // Navega a la nueva página
              );
            },
          ),
          _buildDrawerItem(
            context,
            icon: Icons.history_edu,
            text: 'Vehículos Registrados',
            onTap: () {
              Navigator.pop(context); // Acción para "Vehículos Registrados"
            },
          ),
        ],
      ),
    );
  }

  // Helper para construir cada ítem del Drawer
  static Widget _buildDrawerItem(BuildContext context,
      {required IconData icon, required String text, required VoidCallback onTap}) {
    return ListTile(
      leading: Icon(icon),
      title: Text(text),
      onTap: onTap,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
