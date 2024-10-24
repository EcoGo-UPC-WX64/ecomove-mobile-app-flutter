import 'package:ecomove_flutter_mobile/booking_reservation/reserva.dart';
import 'package:ecomove_flutter_mobile/vehicle_management/nearby_vehicles.dart';
import 'package:flutter/material.dart';

import '../shared/custom_appBar.dart';
import 'available_vehicles.dart';

class VehicleList extends StatelessWidget {
  VehicleList({super.key});

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final List<Map<String, dynamic>> vehiculos = [
    {'nombre': 'Scooter 1', 'imagen': 'lib/assets/images/Media.png'},
    {'nombre': 'Bicicleta 1', 'imagen': 'lib/assets/images/Media.png'},
    {'nombre': 'Scooter 2', 'imagen': 'lib/assets/images/Media.png'},
    {'nombre': 'Bicicleta 2', 'imagen': 'lib/assets/images/Media.png'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: CustomAppBar(
        onMenuPressed: () {
          _scaffoldKey.currentState?.openDrawer();
        },
      ),
      drawer: CustomAppBar.buildDrawer(context),
      body: Container(
        color: const Color(0xFFE6F4FB),
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
            Expanded(
              child: GridView.builder(
                itemCount: vehiculos.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16.0,
                  mainAxisSpacing: 16.0,
                ),
                itemBuilder: (context, index) {
                  final vehiculo = vehiculos[index];
                  return GestureDetector(
                    onTap: () {
                      // Navegar a la página de detalles del vehículo
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ReservaPage(),
                        ),
                      );
                    },
                    child: _buildVehiculoCard(
                      vehiculo['nombre'],
                      vehiculo['imagen'],
                    ),
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

  Widget _buildVehiculoCard(String nombre, String imagePath) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      elevation: 5,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            imagePath,
            height: 100,
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
