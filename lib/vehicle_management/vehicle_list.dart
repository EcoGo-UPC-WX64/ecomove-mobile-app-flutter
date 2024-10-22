import 'package:ecomove_flutter_mobile/vehicle_management/nearby_vehicles.dart';
import 'package:flutter/material.dart';

import 'available_vehicles.dart';

class VehicleList extends StatelessWidget {
  VehicleList({super.key});

  // Lista simulada de vehículos que luego reemplazaremos con datos de la API.
  final List<Map<String, dynamic>> vehiculos = [
    {'nombre': 'Scooter 1', 'imagen': 'lib/assets/images/Media.png'},
    {'nombre': 'Bicicleta 1', 'imagen': 'lib/assets/images/Media.png'},
    {'nombre': 'Scooter 2', 'imagen': 'lib/assets/images/Media.png'},
    {'nombre': 'Bicicleta 2', 'imagen': 'lib/assets/images/Media.png'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color(0xFFE6F4FB), // Color de fondo
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 64.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'MEJORANDO TUS RUTAS',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 30),
            const Text(
              'Elige entre estas opciones',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            // GridView para mostrar los vehículos
            Expanded(
              child: GridView.builder(
                itemCount: vehiculos.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // Dos columnas
                  crossAxisSpacing: 16.0, // Espacio horizontal
                  mainAxisSpacing: 16.0, // Espacio vertical
                ),
                itemBuilder: (context, index) {
                  final vehiculo = vehiculos[index];
                  return _buildVehiculoCard(
                    vehiculo['nombre']!,
                    vehiculo['imagen']!,
                  );
                },
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF4F889E),
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(
                    horizontal: 32.0, vertical: 12.0),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const NearbyVehicles(),
                  ),
                );
              },
              child: const Text('Ver vehículos cercanos'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF4F889E),
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(
                    horizontal: 32.0, vertical: 12.0),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AvailableVehicles(),
                  ),
                );
              },
              child: const Text('Vehículos disponibles'),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  // Widget para construir cada tarjeta de vehículo
  Widget _buildVehiculoCard(String nombre, String imagePath) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      elevation: 5, // Sombra en la tarjeta
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            imagePath,
            height: 100, // Tamaño de la imagen
            width: 100,
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 10),
          Text(
            nombre,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
