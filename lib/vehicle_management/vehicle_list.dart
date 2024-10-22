import 'package:ecomove_flutter_mobile/vehicle_management/nearby_vehicles.dart';
import 'package:ecomove_flutter_mobile/vehicle_management/vehicle_location.dart';
import 'package:flutter/material.dart';

import '../custom_appBar.dart';

class VehicleList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: Container(
        color: const Color(0xFFE6F4FB),
        padding: const EdgeInsets.symmetric(horizontal: 36.0, vertical: 64.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'MEJORANDO TUS RUTAS',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'Elige entre estas opciones',
              style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 36),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing:36.0,
                mainAxisSpacing: 36.0,

                children: [
                  _buildMenuButton(
                    iconPath: 'lib/assets/images/Media.png',
                    label: 'Scooters',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => VehicleLocation()),);
                    },
                  ),
                  _buildMenuButton(
                    iconPath: 'lib/assets/images/Media.png',
                    label: 'Scooters',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => VehicleLocation()),);
                    },
                  ),
                  _buildMenuButton(
                    iconPath: 'lib/assets/images/Media.png',
                    label: 'Scooters',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => VehicleLocation()),);
                    },
                  ),
                  _buildMenuButton(
                    iconPath: 'lib/assets/images/Media.png',
                    label: 'Scooters',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => VehicleLocation()),);
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NearbyVehicles()),);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF4F889E),
                foregroundColor: Colors.white,
                // Color personalizado
              ),
              child: const Text('Ver vehículos cercanos'),
            ),
            const SizedBox(height: 100),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuButton(
      {required String label, required VoidCallback? onPressed, required String iconPath}) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade300,
              spreadRadius: 2,
              blurRadius: 5,
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              iconPath, // Usa el icono personalizado desde el path
              height: 100, // Tamaño del icono
              width: 100,
            ),
            const SizedBox(height: 20.0),
            Text(label, style: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}