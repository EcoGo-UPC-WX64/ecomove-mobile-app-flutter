import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import '../services/api_service.dart';
import '../shared/custom_returnAppBar.dart';

class NearbyVehicles extends StatefulWidget {
  const NearbyVehicles({super.key});

  @override
  _NearbyVehiclesState createState() => _NearbyVehiclesState();
}

class _NearbyVehiclesState extends State<NearbyVehicles> {
  late GoogleMapController _mapController;
  final Set<Marker> _markers = {};
  final ApiService apiService = ApiService();
  LatLng? _currentLocation;

  @override
  void initState() {
    super.initState();
    _determinePosition();
    _loadVehicleMarkers();
  }

  Future<void> _determinePosition() async {
    Location location = Location();

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

    final userLocation = await location.getLocation();
    _currentLocation = LatLng(userLocation.latitude!, userLocation.longitude!);

    _markers.add(
      Marker(
        markerId: const MarkerId('current_location'),
        position: _currentLocation!,
        infoWindow: const InfoWindow(title: 'Mi Ubicación'),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
      ),
    );

    setState(() {});
  }

  Future<void> _loadVehicleMarkers() async {
    try {
      final vehiculos = await apiService.getVehicles();

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

      setState(() {});
    } catch (e) {
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
      appBar: const CustomReturnAppBar(),
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
