import 'package:ecomove_flutter_mobile/user_management/blog_confirmation.dart';
import 'package:flutter/material.dart';
import '../custom_returnAppBar.dart';
import 'profile.dart';

class BlogPostPage extends StatefulWidget {
  const BlogPostPage({super.key});

  @override
  State<BlogPostPage> createState() => _BlogPostPageState();
}

class _BlogPostPageState extends State<BlogPostPage> {
  // Controladores para obtenr los valores de los campos de texto
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomReturnAppBar(),
      body: Container(
        color: const Color(0xFFE6F4FB), // Color de fondo del cuerpo
        padding: const EdgeInsets.symmetric(horizontal: 60.0, vertical: 64.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: Text(
                'PUBLICAR EN EL BLOG',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 64),
            const Text(
              'Titulo del blog:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            TextFormField(
              controller: _titleController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(16.0)),
                  borderSide: BorderSide.none
                ),
                hintText: 'Ingresa el título',
                filled: true,
                fillColor: Colors.white,
              ),

            ),
            const SizedBox(height: 30),
            const Text(
              'Contenido del blog:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            TextFormField(
              controller: _contentController,
              maxLines: 5, // El área de texto más grande para el contenido
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(16.0)),
                  borderSide: BorderSide.none,
                ),
                hintText: 'Ingresa el contenido',
                filled: true,
                fillColor: Colors.white,
              ),
            ),
            const SizedBox(height: 30),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Acción para publicar el blog
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const BlogConfirmation()));
                  String title = _titleController.text;
                  String content = _contentController.text;

                  // Manejar la publicación del blog, enviarlo a un servidor, etc.
                  print('Título: $title');
                  print('Contenido: $content');
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  backgroundColor: const Color(0xFF4F889E),
                  foregroundColor: Colors.white,
                ),
                child: const Text(
                  'Publicar en el Blog',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
