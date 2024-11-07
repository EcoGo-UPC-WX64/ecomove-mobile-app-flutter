import 'package:flutter/material.dart';
import '../services/api_service.dart';

import '../shared/custom_returnAppBar.dart'; // Importa Provider si estÃ¡s usando un provider para el userId

class TravelsRecordPage extends StatefulWidget {
  const TravelsRecordPage({super.key});

  @override
  _TravelsRecordPageState createState() => _TravelsRecordPageState();
}

class _TravelsRecordPageState extends State<TravelsRecordPage> {
  ApiService apiService = ApiService();
  List<dynamic> viajes = [];
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
      setState(() {
        viajes = data;
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
                                child: const Text(
                                  'A',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                              title: Text(
                                  'Fecha de Inicio: ${startTime.day}/${startTime.month}/${startTime.year}'),
                              subtitle: Text(
                                  'Fecha de Fin: ${endTime.day}/${endTime.month}/${endTime.year}'),
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
