import 'package:ecomove_flutter_mobile/services/api_service.dart';
import 'package:ecomove_flutter_mobile/vehicle_management/nearby_vehicles.dart';
import 'package:flutter/material.dart';

import '../booking_reservation/reserva.dart';
import '../shared/custom_appBar.dart';
import 'available_vehicles.dart';

class VehicleList extends StatelessWidget {
  VehicleList({super.key});

  final ApiService apiService = ApiService(); // Instancia de ApiService
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

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
            // Carga los datos de los vehículos usando FutureBuilder
            Expanded(
              child: FutureBuilder<List<Map<String, dynamic>>>(
                future: apiService.getVehicles(), // Llama al método de API
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const Center(
                        child: Text('No se encontraron vehículos.'));
                  } else {
                    final vehiculos = snapshot.data!;
                    return GridView.builder(
                      itemCount: vehiculos.length,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2, // Dos columnas
                        crossAxisSpacing: 16.0, // Espacio horizontal
                        mainAxisSpacing: 16.0, // Espacio vertical
                      ),
                      itemBuilder: (context, index) {
                        final vehiculo = vehiculos[index];
                        return GestureDetector(
                          onTap: () {
                            // Navegar a ReservaPage y pasar el vehicleId
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ReservaPage(vehicleId: vehiculo['id']),
                              ),
                            );
                          },
                          child: _buildVehiculoCard(
                            vehiculo['model'] ?? 'Vehículo',
                            vehiculo['imageUrl'] ?? 'lib/assets/images/placeholder.png',
                          ),
                        );
                      },
                    );
                  }
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
            /*ElevatedButton(
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
            ),*/
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildVehiculoCard(String nombre, String imageUrl) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      elevation: 5,
      child: SizedBox(
        height: 100, // Ajusta la altura aquí
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              imageUrl,
              height: 100,
              width: 100,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Image.asset(
                  'lib/assets/images/placeholder.png', // Imagen de reemplazo
                  height: 100,
                  width: 100,
                  fit: BoxFit.cover,
                );
              },
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
      ),
    );
  }
}
