import 'package:flutter/material.dart';
import '../shared/custom_returnAppBar.dart';
import 'publish_blog.dart';
import 'package:ecomove_flutter_mobile/services/api_service.dart';

class BlogPage extends StatelessWidget {
  BlogPage({super.key});

  final ApiService apiService = ApiService();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: const CustomReturnAppBar(),
      body: Container(
        color: const Color(0xFFE6F4FB),
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            Expanded(
              child: FutureBuilder<List<Map<String, dynamic>>>(
                future: apiService
                    .getBlogs(), // Llama al método de API para obtener blogs
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const Center(
                      child: Text('No se encontraron blogs.'),
                    );
                  } else {
                    final blogs = snapshot.data!;
                    return ListView.builder(
                      itemCount: blogs.length,
                      itemBuilder: (context, index) {
                        final blog = blogs[index];
                        return _buildBlogCard(
                          blog['title'] ?? 'Nombre desconocido',
                          blog['description'] ?? 'Sin descripción',
                          blog['profileImage'] ??
                              'assets/images/default_profile.png',
                        );
                      },
                    );
                  }
                },
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

  Widget _buildBlogCard(String name, String description, String imagePath) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage(imagePath),
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
                    description,
                    style: const TextStyle(fontSize: 14),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF4F889E),
                      foregroundColor: Colors.white,
                    ),
                    child: const Text('Ver blog'),
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
