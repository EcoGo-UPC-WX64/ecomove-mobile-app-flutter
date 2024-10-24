import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AvailableVehicles extends StatefulWidget {
  const AvailableVehicles({super.key});

  @override
  _AvailableVehiclesState createState() => _AvailableVehiclesState();
}

class _AvailableVehiclesState extends State<AvailableVehicles> {
  late GoogleMapController _mapController;
  final Set<Marker> _markers = {};

  // Datos simulados de disponibilidad
  final int totalVehiculos = 10;
  final int totalScooters = 7;
  final int totalBicicletas = 3;

  @override
  void initState() {
    super.initState();
    _agregarMarcadoresSimulados();
  }

  void _agregarMarcadoresSimulados() {
    final List<Map<String, dynamic>> vehiculos = [
      {'nombre': 'Scooter 1', 'lat': -12.0464, 'lng': -77.0428},
      {'nombre': 'Bicicleta 1', 'lat': -12.0453, 'lng': -77.0311},
      {'nombre': 'Scooter 2', 'lat': -12.0445, 'lng': -77.0376},
    ];

    for (var vehiculo in vehiculos) {
      _markers.add(
        Marker(
          markerId: MarkerId(vehiculo['nombre']),
          position: LatLng(vehiculo['lat'], vehiculo['lng']),
          infoWindow: InfoWindow(
            title: vehiculo['nombre'],
            snippet: 'Ubicación simulada',
          ),
        ),
      );
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE6F4FB),
      appBar: AppBar(
        backgroundColor: const Color(0xFFE6F4FB),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Vehículos disponibles',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            // Tarjetas de disponibilidad de vehículos
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildDisponibilidadCard('Vehículos\nDisponibles', totalVehiculos, Colors.teal),
                _buildDisponibilidadCard('Scooters', totalScooters, Colors.blue),
                _buildDisponibilidadCard('Bicicletas', totalBicicletas, Colors.orange),
              ],
            ),
            const SizedBox(height: 16),
            // Input para ubicación
            /*TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                hintText: 'Ubicación',
              ),
            ),*/
            const SizedBox(height: 20),
            // Mapa con marcadores
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16.0),
                child: GoogleMap(
                  initialCameraPosition: const CameraPosition(
                    target: LatLng(-12.0464, -77.0428),
                    zoom: 14,
                  ),
                  markers: _markers,
                  onMapCreated: (GoogleMapController controller) {
                    _mapController = controller;
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget para mostrar cada métrica de disponibilidad en una tarjeta
  Widget _buildDisponibilidadCard(String label, int count, Color color) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              label,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            CircleAvatar(
              radius: 20,
              backgroundColor: color,
              child: Text(
                '$count',
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

