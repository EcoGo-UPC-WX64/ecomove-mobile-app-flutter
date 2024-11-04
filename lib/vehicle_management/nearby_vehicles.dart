import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import '../services/api_service.dart';

class NearbyVehicles extends StatefulWidget {
  const NearbyVehicles({super.key});

  @override
  _NearbyVehiclesState createState() => _NearbyVehiclesState();
}

class _NearbyVehiclesState extends State<NearbyVehicles> {
  late GoogleMapController _mapController;
  final Set<Marker> _markers = {};
  final ApiService apiService = ApiService(); // Instancia de ApiService
  LatLng? _currentLocation; // Almacena la ubicación actual

  @override
  void initState() {
    super.initState();
    _determinePosition(); // Obtener la ubicación actual del usuario
    _loadVehicleMarkers(); // Cargar marcadores de vehículos desde la API
  }

  // Método para obtener la ubicación actual del usuario
  Future<void> _determinePosition() async {
    Location location = Location();

    // Solicitar permiso de ubicación si no está concedido
    bool serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        return;
      }
    }

    PermissionStatus permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    // Obtener la ubicación actual
    final userLocation = await location.getLocation();
    _currentLocation = LatLng(userLocation.latitude!, userLocation.longitude!);

    // Añadir marcador de ubicación actual
    _markers.add(
      Marker(
        markerId: const MarkerId('current_location'),
        position: _currentLocation!,
        infoWindow: const InfoWindow(title: 'Mi Ubicación'),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
      ),
    );

    setState(() {}); // Actualizar el mapa
  }

  Future<void> _loadVehicleMarkers() async {
    try {
      final vehiculos = await apiService.getVehicles(); // Obtener vehículos desde la API

      // Crear un marcador para cada vehículo
      for (var vehiculo in vehiculos) {
        final marker = Marker(
          markerId: MarkerId(vehiculo['model']),
          position: LatLng(
            vehiculo['location']['latitude'],
            vehiculo['location']['longitude'],
          ),
          infoWindow: InfoWindow(
            title: vehiculo['model'],
            snippet: 'Nivel de batería: ${vehiculo['batteryLevel']}%',
          ),
        );
        _markers.add(marker);
      }

      setState(() {}); // Redibujar el mapa con los nuevos marcadores
    } catch (e) {
      // Manejo de errores
      print('Error al cargar vehículos: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error al cargar vehículos cercanos')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE6F4FB),
      appBar: AppBar(
        backgroundColor: const Color(0xFFE6F4FB),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Vehículos cercanos',
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
                    if (_currentLocation != null) {
                      // Mover el mapa a la ubicación actual
                      _mapController.animateCamera(
                        CameraUpdate.newLatLng(_currentLocation!),
                      );
                    }
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
