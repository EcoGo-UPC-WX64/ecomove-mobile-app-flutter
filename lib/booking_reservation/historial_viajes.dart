import 'package:flutter/material.dart';
import '../services/api_service.dart'; // Importa el servicio API

class HistorialViajesPage extends StatefulWidget {
  const HistorialViajesPage({super.key});

  @override
  _HistorialViajesPageState createState() => _HistorialViajesPageState();
}

class _HistorialViajesPageState extends State<HistorialViajesPage> {
  ApiService apiService = ApiService(); // Instancia del servicio API
  List<dynamic> viajes = []; // Lista para almacenar los viajes obtenidos
  bool isLoading = true; // Estado de carga

  @override
  void initState() {
    super.initState();
    fetchHistorialViajes(); // Llamar a la API cuando el widget se inicialice
  }

  // Función para obtener el historial de viajes desde la API
  void fetchHistorialViajes() async {
    try {
      final data = await apiService.getAllBookings(); // Llamada a la API
      setState(() {
        viajes = data;
        isLoading = false; // Cambia el estado cuando los datos sean recibidos
      });
    } catch (e) {
      print('Error fetching bookings: $e');
      setState(() {
        isLoading = false; // Detener el estado de carga si hay un error
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE3F2FD), // Fondo azul claro
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Título
            const SizedBox(height: 120),
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
                      itemCount: viajes.length, // Número de elementos en la lista
                      itemBuilder: (context, index) {
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
                              title: const Text('Fecha de Uso'),
                              subtitle: Text(viajes[index]['date']), // Asegúrate de usar el campo correcto para la fecha
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
