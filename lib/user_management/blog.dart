import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../shared/custom_returnAppBar.dart';
import 'publish_blog.dart';
import 'profile.dart';

class BlogPage extends StatefulWidget {
  const BlogPage({super.key});

  @override
  _BlogPageState createState() => _BlogPageState();
}

class _BlogPageState extends State<BlogPage> {
  List<Map<String, dynamic>> _reviews = [];

  @override
  void initState() {
    super.initState();
    _loadInitialData(); // Cargar datos iniciales
    _fetchReviews(); // Llamar a la API para obtener datos reales
  }

  // Carga de datos iniciales para mostrar mientras se espera la respuesta de la API
  void _loadInitialData() {
    _reviews = [
      {
        'name': 'Emiliano Martinez',
        'description': 'Excelente opción para movilizarse en la ciudad, muy sencillo los pasos para utilizarla. y lo mejor es económico. Me encantó',
        'profileImage': 'assets/images/profile1.png',
      },
      {
        'name': 'Catriel Cabellos',
        'description': 'Excelente opción para movilizarse en la ciudad, muy sencillo los pasos para utilizarla. y lo mejor es económico. Me encantó',
        'profileImage': 'assets/images/profile2.png',
      },
    ];
  }

  Future<void> _fetchReviews() async {
    final response = await _getRequest('/api/v1/blog');
    if (response != null && response.statusCode == 200) {
      print('Datos obtenidos de la API: ${response.body}'); // Imprimir datos obtenidos
      setState(() {
        // Actualizar _reviews con datos de la API
        _reviews = List<Map<String, dynamic>>.from(json.decode(response.body));
      });
    } else {
      print('Error al obtener reseñas: ${response?.statusCode}');
    }
  }

  Future<http.Response?> _getRequest(String endpoint) async {
    final url = Uri.parse('https://ecomove-api.azurewebsites.net$endpoint');
    try {
      final response = await http.get(
        url,
        headers: {
          'Content-Type': 'application/json',
          // 'Authorization': 'Bearer <your_token_here>', // Agrega tu token si es necesario
        },
      );
      return response;
    } catch (error) {
      print('Error en la solicitud GET: $error');
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomReturnAppBar(),
      body: Container(
        color: const Color(0xFFE6F4FB),
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: _reviews.length,
                itemBuilder: (context, index) {
                  final review = _reviews[index];
                  return _buildReviewCard(
                    review['name'] ?? 'Nombre desconocido',
                    review['description'] ?? 'Sin descripción',
                    review['profileImage'] ?? 'assets/images/default_profile.png',
                  );
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
