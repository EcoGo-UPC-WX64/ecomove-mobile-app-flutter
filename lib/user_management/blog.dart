import 'package:flutter/material.dart';
import '../custom_returnAppBar.dart';
import 'publish_blog.dart';
import 'profile.dart';

class BlogPage extends StatelessWidget {
  const BlogPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomReturnAppBar(),
      body: Container(
        color: const Color(0xFFE6F4FB), // Color de fondo del cuerpo
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  _buildReviewCard(
                    'Emiliano Martinez',
                    'Excelente opción para movilizarse en la ciudad, muy sencillo los pasos para utilizarla. y lo mejor es económico. Me encantó',
                    'assets/images/profile1.png', // Ruta de la imagen de perfil
                  ),
                  const SizedBox(height: 16),
                  _buildReviewCard(
                    'Catriel Cabellos',
                    'Excelente opción para movilizarse en la ciudad, muy sencillo los pasos para utilizarla. y lo mejor es económico. Me encantó',
                    'assets/images/profile2.png', // Ruta de la imagen de perfil
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const BlogPostPage()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF4F889E),
                foregroundColor: Colors.white,
              ),
              child: const Text('Publicar en el Blog'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildReviewCard(String name, String review, String imagePath) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage(imagePath), // Imagen de perfil
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    review,
                    style: const TextStyle(fontSize: 14),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      // Acción del botón "Ver reseña"
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF4F889E),
                      foregroundColor: Colors.white,
                    ),
                    child: const Text('Ver reseña'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
