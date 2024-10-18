import 'package:flutter/material.dart';
import 'profile.dart';

class MedallasPage extends StatelessWidget {
  final List<Map<String,String>> medallas= List.generate(
      5,
      (index) => {
        'titulo': 'Medalla $index',
        'descripcion': 'Descripcion de la medalla $index',
        'iconPath': 'lib/assets/images/ic_logros.png',
      },
  );

  MedallasPage({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF55889D), // Color de fondo de la AppBar
        elevation: 0, // Sin sombra bajo la AppBar
        automaticallyImplyLeading: true,
        iconTheme: const IconThemeData(color: Colors.white),
        actions: [
          IconButton(
            icon: const Icon(Icons.account_circle, color: Colors.white),
            onPressed: () {
              // Funcionalidad del botón de perfil
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ProfilePage()),);
            },
          ),
        ],
      ),
      body: Container(
        color: const Color(0xFFE6F4FB), // Color de fondo del cuerpo
        padding: const EdgeInsets.symmetric(horizontal: 36.0, vertical: 64.0),
        child: Column(
          children: [
            const Center(
              child: Text(
                'MEDALLAS OBTENIDAS',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: medallas.length,
                itemBuilder: (context, index) {
                  final medalla = medallas[index];
                  return _buildMedallaCard(
                    medalla['titulo']!,
                    medalla['descripcion']!,
                    medalla['iconPath']!,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMedallaCard(String? titulo, String? descripcion, String? iconPath) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            CircleAvatar(
              radius: 30,
              backgroundImage: iconPath != null
                  ? AssetImage(iconPath)
                  : null, // Verificamos si la imagen no es null
              backgroundColor: Colors.grey.shade200, // Color de fondo si no hay imagen
            ),
            const SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  titulo ?? 'Sin título', // Muestra "Sin título" si es null
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  descripcion ?? 'Sin descripción', // Muestra "Sin descripción" si es null
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

}

