import 'package:flutter/material.dart';
import '../services/api_service_v2.dart'; // Importa el servicio API

class AlquilarVehiculoPage extends StatefulWidget {
  const AlquilarVehiculoPage({super.key});

  @override
  _AlquilarVehiculoPageState createState() => _AlquilarVehiculoPageState();
}

class _AlquilarVehiculoPageState extends State<AlquilarVehiculoPage> {
  String _codigo = "47273";
  ApiService apiService = ApiService(); // Instancia del servicio API

  // Función para regenerar el código
  void _regenerarCodigo() {
    setState(() {
      _codigo = (int.parse(_codigo) + 500).toString();
    });
  }

  // Función para crear la reserva y enviar a la API
  void _confirmarReserva() async {
    try {
      Map<String, dynamic> bookingData = {
        'vehicle': _codigo, // Suponiendo que 'vehicle' es el código generado
      };
      await apiService.createBooking(bookingData); // Llamada a la API para crear la reserva

      // Pasar el código generado como argumento
      Navigator.pushNamed(
        context,
        '/confirmacion',
        arguments: _codigo, // Pasa el código como argumento
      );
    } catch (e) {
      print('Error al crear la reserva: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error al crear la reserva: ${e.toString()}')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE3F2FD), // Color de fondo claro
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Texto principal
                const Text(
                  'Introduce este código para poder usar el vehículo',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 40),
                
                // Contenedor del código
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(
                      color: Colors.black,
                      width: 2, // Borde negro para el código
                    ),
                  ),
                  child: Text(
                    '#$_codigo',
                    style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                // Botón para regenerar el código
                ElevatedButton(
                  onPressed: _regenerarCodigo,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF4F889E), // Color personalizado
                    padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 30),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30), // Bordes redondeados
                    ),
                  ),
                  child: const Text(
                    'Volver a generar',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                
                // Botón para confirmar la reserva y continuar
                ElevatedButton(
                  onPressed: _confirmarReserva, // Llama a la función que confirma la reserva
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF4F889E), // Color personalizado
                    padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 30),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30), // Bordes redondeados
                    ),
                  ),
                  child: const Text(
                    'Confirmar y continuar',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
