import 'package:ecomove_flutter_mobile/custom_appBar.dart';
import 'package:flutter/material.dart';

import 'blog.dart';
import 'achievements.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: Container(
        color: const Color(0xFFE6F4FB), // Color de fondo del cuerpo
          padding: const EdgeInsets.symmetric(horizontal: 36.0, vertical: 64.0), // Espaciado general,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Bienvenido, Usuario',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              // Sección de cerrar sesión con ícono y texto
              GestureDetector(
                onTap: () {
                  // Lógica para cerrar sesión
                },
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.logout, color: Colors.black),
                    SizedBox(width: 8.0), // Espacio entre ícono y texto
                    Text(
                      'Cerrar sesión',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 36),
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing:36.0,
                  mainAxisSpacing: 36.0,
                  children: [
                    _buildMenuButton(
                      iconPath: 'lib/assets/images/ic_reserva.png',
                      label: 'Reserva',
                      onPressed: () {
                        // Add navigation to Reserva
                      },
                    ),
                    _buildMenuButton(
                      iconPath: 'lib/assets/images/ic_logros.png',
                      label: 'Logros',
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => MedallasPage()),
                        );
                      },
                    ),
                    _buildMenuButton(
                      iconPath: 'lib/assets/images/ic_historial.png',
                      label: 'Historial',
                      onPressed: () {
                        // Add navigation to Historial
                      },
                    ),
                    _buildMenuButton(
                      iconPath: 'lib/assets/images/ic_blog.png',
                      label: 'Blog',
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => BlogPage()),
                        );
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // Add Support action
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF4F889E),
                      foregroundColor: Colors.white,
                      // Color personalizado
                    ),
                    child: const Text('Soporte'),

                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Add Alerts action
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF4F889E),
                      foregroundColor: Colors.white,
                      // Color personalizado
                    ),
                    child: const Text('Alertas'),
                  ),
                ],
              ),
              const SizedBox(height: 150),
            ],
          ),
        ),
    );
  }

  Widget _buildMenuButton(
      {required String label, required VoidCallback? onPressed, required String iconPath}) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.0),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade300,
              spreadRadius: 2,
              blurRadius: 5,
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              iconPath, // Usa el icono personalizado desde el path
              height: 80, // Tamaño del icono
              width: 80,
            ),
            const SizedBox(height: 10.0),
            Text(label, style: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}