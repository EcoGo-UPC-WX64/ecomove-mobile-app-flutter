import 'package:ecomove_flutter_mobile/services/api_service.dart';
import 'package:ecomove_flutter_mobile/user_management/blog_confirmation.dart';
import 'package:flutter/material.dart';
import '../shared/custom_returnAppBar.dart';

class BlogPostPage extends StatefulWidget {
  const BlogPostPage({super.key});

  @override
  State<BlogPostPage> createState() => _BlogPostPageState();
}

class _BlogPostPageState extends State<BlogPostPage> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final ApiService apiService = ApiService();

  Future<void> _publishBlog() async {
    String title = _titleController.text;
    String description = _descriptionController.text;

    if (title.isEmpty || description.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Completa todos los campos')),
      );
      return;
    }

    final blogData = {
      'title': title,
      'description': description,
      'userId': apiService.userId,
    };

    try {
      await apiService.postBlogs(blogData); // Publica el blog en la API
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const BlogConfirmation()),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error al publicar el blog: $e')),
      );
    }
  }

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
              'Título del blog:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            TextFormField(
              controller: _titleController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(16.0)),
                  borderSide: BorderSide.none,
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
              controller: _descriptionController,
              maxLines: 5, // Área de texto más grande para el contenido
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
                onPressed: _publishBlog, // Llama al método para publicar
                style: ElevatedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
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

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }
}
