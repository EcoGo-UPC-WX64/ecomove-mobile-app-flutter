import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class VehicleLocation extends StatefulWidget {
  const VehicleLocation({super.key});

  @override
  _VehicleLocationState createState() => _VehicleLocationState();
}

class _VehicleLocationState extends State<VehicleLocation> {
  late GoogleMapController _mapController;
  final Set<Marker> _markers = {};

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

    // Agregar marcadores al Set
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
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 32.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Ubicación de sccoters o biciclestas',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
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
}
