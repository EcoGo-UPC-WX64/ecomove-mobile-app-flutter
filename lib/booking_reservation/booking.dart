import 'package:flutter/material.dart';
import '../services/api_service.dart';
import 'alquilar_vehiculo.dart';

class ReservaPage extends StatefulWidget {
  final int vehicleId; // Recibe el vehicleId

  const ReservaPage({super.key, required this.vehicleId});

  @override
  _ReservaPageState createState() => _ReservaPageState();
}

class _ReservaPageState extends State<ReservaPage> {
  DateTime? _fechaInicio;
  DateTime? _fechaFin;
  final TextEditingController _distritoController = TextEditingController();
  ApiService apiService = ApiService();

  Future<void> _selectDate(BuildContext context, bool isFechaInicio) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2022),
      lastDate: DateTime(2025),
    );

    if (picked != null) {
      setState(() {
        if (isFechaInicio) {
          _fechaInicio = picked;
        } else {
          _fechaFin = picked;
        }
      });
    }
  }

  // Función para crear la reserva
  void _crearReserva() async {
    if (_fechaInicio == null || _fechaFin == null || _distritoController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Por favor, selecciona las fechas de inicio y fin y el distrito')),
      );
      return;
    }

    try {
      // Crear el objeto para enviar a la API
      Map<String, dynamic> reservaData = {
        'userId': apiService.userId, // ID del usuario que obtenemos de ApiService
        'vehicleId': widget.vehicleId, // Aquí puedes poner el ID del vehículo correspondiente
        'startTime': _fechaInicio?.toIso8601String(),
        'endTime': _fechaFin?.toIso8601String(),
        'status': "Activo",
      };

      // Llamada al servicio de API para crear la reserva
      await apiService.createBooking(reservaData);

      // Mostrar mensaje de éxito
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Reserva creada con éxito')),
      );

      // Regresar o actualizar la interfaz según lo necesites
      Navigator.pop(context);

    } catch (e) {
      print('Error al crear la reserva: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error al crear la reserva: ${e.toString()}')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    const Color customColor = Color(0xFF4F889E);
    return Scaffold(
      backgroundColor: const Color(0xFFE3F2FD),
      appBar: AppBar(
        backgroundColor: customColor,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'RESERVA',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 10,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Campo para seleccionar la fecha de inicio
                    TextFormField(
                      readOnly: true,
                      decoration: InputDecoration(
                        labelText: 'Fecha inicio',
                        labelStyle: const TextStyle(color: Colors.black),
                        floatingLabelStyle: const TextStyle(color: Colors.black),
                        suffixIcon: const Icon(Icons.calendar_today),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: customColor, width: 2),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: customColor, width: 2),
                        ),
                        contentPadding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 12.0),
                      ),
                      onTap: () => _selectDate(context, true),
                      controller: TextEditingController(
                        text: _fechaInicio != null ? "${_fechaInicio!.month}/${_fechaInicio!.day}/${_fechaInicio!.year}" : '',
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Campo para seleccionar la fecha de fin
                    TextFormField(
                      readOnly: true,
                      decoration: InputDecoration(
                        labelText: 'Fecha fin',
                        labelStyle: const TextStyle(color: Colors.black),
                        floatingLabelStyle: const TextStyle(color: Colors.black),
                        suffixIcon: const Icon(Icons.calendar_today),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: customColor, width: 2),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: customColor, width: 2),
                        ),
                        contentPadding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 12.0),
                      ),
                      onTap: () => _selectDate(context, false),
                      controller: TextEditingController(
                        text: _fechaFin != null ? "${_fechaFin!.month}/${_fechaFin!.day}/${_fechaFin!.year}" : '',
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Campo de texto para el distrito
                    TextFormField(
                      controller: _distritoController,
                      decoration: InputDecoration(
                        labelText: 'Distrito',
                        labelStyle: const TextStyle(color: Colors.black),
                        floatingLabelStyle: const TextStyle(color: Colors.black),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: customColor, width: 2),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: customColor, width: 2),
                        ),
                        contentPadding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 12.0),
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Botón para comenzar la reserva
                    SizedBox(
                      width: 180,
                      child: ElevatedButton(
                        onPressed: () {
                          _crearReserva(); // Llama a la función para crear la reserva

                          // Después de crear la reserva, navega a otra página, por ejemplo:
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const AlquilarVehiculoPage(), // Cambia `NearbyVehicles` por la página que deseas mostrar
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: customColor,
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        child: const Text(
                          'Comenzar reserva',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
