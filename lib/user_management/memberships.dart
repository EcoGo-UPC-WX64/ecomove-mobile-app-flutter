import 'package:flutter/material.dart';
import '../payment/metodo_pago.dart';
import '../shared/custom_returnAppBar.dart';

class SuscripcionesPage extends StatelessWidget {
  // Lista de suscripciones simulada
  final List<Map<String, String>> suscripciones = List.generate(
    3,
        (index) => {
      'titulo': 'Membresía Premium',
      'descripcion': 'Tarifa mensual con beneficios adicionales.',
      'detalles':
      '• Acceso ilimitado a viajes.\n• Tiempo extendido por viaje.\n• Prioridad en zonas con alta demanda.',
      'precio': 'S/39.90',
    },
  );

  SuscripcionesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomReturnAppBar(), // AppBar personalizado
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
                    context, // Pasamos el contexto al widget de la tarjeta
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

  // Widget para construir la tarjeta de suscripción
  Widget _buildSuscripcionCard(
      BuildContext context,
      String titulo,
      String descripcion,
      String detalles,
      String precio,
      ) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      margin: const EdgeInsets.symmetric(vertical: 16.0),
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
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
              style: const TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
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
            // Botón de suscripción
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MetodoPagoPage(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF4F889E),
                  foregroundColor: Colors.white,
                ),
                child: const Text('Suscribirme'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
