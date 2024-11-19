import 'package:flutter/material.dart';
import '../services/api_service.dart';

import '../shared/custom_returnAppBar.dart'; // Importa Provider si estás usando un provider para el userId

class HistorialViajesPage extends StatefulWidget {
  const HistorialViajesPage({super.key});

  @override
  _HistorialViajesPageState createState() => _HistorialViajesPageState();
}

class _HistorialViajesPageState extends State<HistorialViajesPage> {
  ApiService apiService = ApiService();
  List<dynamic> viajes = [];
  List<dynamic> vehiculos = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchHistorialViajes();
  }

  void fetchHistorialViajes() async {
    try {
      final userId = apiService.userId;
      final data = await apiService.getBookingsByUserId(userId!);
      final data2 = await apiService.getVehicles();
      setState(() {
        viajes = data;
        vehiculos = data2;
        isLoading = false;
      });
    } catch (e) {
      print('Error fetching bookings: $e');
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE3F2FD),
        appBar: const CustomReturnAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 80),
            const Text(
              'HISTORIAL DE VIAJES',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),

            // Mostrar indicador de progreso mientras se cargan los viajes
            isLoading
                ? const Center(child: CircularProgressIndicator())
                : Expanded(
              child: ListView.builder(
                itemCount: viajes.length,
                itemBuilder: (context, index) {
                  final viaje = viajes[index];
                  final startTime = DateTime.parse(viaje['startTime']);
                  final endTime = DateTime.parse(viaje['endTime']);
                  final vId = viaje['vehicleId'];
                  var vehiculo;
                  vehiculos.forEach((v) {
                    if (v['id']==vId){
                      vehiculo = v;
                    };
                  });
                  final nombre = vehiculo['model'];
                  final imagen = vehiculo['imageUrl'];

                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        side: const BorderSide(color: Colors.black12),
                      ),
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundColor: const Color(0xFF607D8B),
                          child: Image.network(
                            imagen,
                            height: 80,
                            width: 80,
                            fit: BoxFit.contain,
                            errorBuilder: (context, error, stackTrace) {
                              return Image.asset(
                                'lib/assets/images/placeholder.png', // Imagen de reemplazo
                                height: 80,
                                width: 80,
                                fit: BoxFit.contain,
                              );
                            },
                          ),
                        ),
                        title: Text(
                            'Fecha de Inicio: ${startTime.day}/${startTime.month}/${startTime.year}'),
                        subtitle: Text(
                            'Fecha de Fin: ${endTime.day}/${endTime.month}/${endTime.year}'),

                        trailing: Text(
                          'Vehículo: ${nombre}'
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
