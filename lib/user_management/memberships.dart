import 'package:flutter/material.dart';
import '../custom_returnAppBar.dart';
import 'profile.dart';

class SuscripcionesPage extends StatelessWidget {
  // Lista de suscripciones
  final List<Map<String, String>> suscripciones = List.generate(
    3,
        (index) => {
      'titulo': 'Membresía Premium',
      'descripcion': 'Tarifa mensual más alta con beneficios adicionales.',
      'detalles':
      '• Acceso ilimitado a viajes al mes.\n• Tiempo de alquiler extendido por viaje.\n• Prioridad de acceso en zonas con alta demanda.',
      'precio': 'S/39.90',
    },
  );

  SuscripcionesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomReturnAppBar(),
      body: Container(
        color: const Color(0xFFE6F4FB), // Color de fondo
        padding: const EdgeInsets.symmetric(horizontal: 64.0, vertical: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: Center(
                child: Text(
                  'SUSCRIPCIONES',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: suscripciones.length,
                itemBuilder: (context, index) {
                  final suscripcion = suscripciones[index];
                  return _buildSuscripcionCard(
                    suscripcion['titulo']!,
                    suscripcion['descripcion']!,
                    suscripcion['detalles']!,
                    suscripcion['precio']!,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSuscripcionCard(
      String titulo, String descripcion, String detalles, String precio) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      margin: const EdgeInsets.symmetric(vertical: 12.0),
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              titulo,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 12.0),
            Text(
              descripcion,
              style: const TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 12.0),
            Text(
              detalles,
              style: const TextStyle(fontSize: 14, color: Colors.grey),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 12.0),
            Text(
              precio,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12.0),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Acción para más información
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF4F889E),
                  foregroundColor: Colors.white,
                  // Color personalizado
                ),
                child: const Text('Más información'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
