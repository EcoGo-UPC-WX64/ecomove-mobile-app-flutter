import 'package:flutter/material.dart';

import '../vehicle_management/vehicle_list.dart';

class ConfirmationPage extends StatelessWidget {
  final String bookingCode;

  const ConfirmationPage({super.key, required this.bookingCode});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE3F2FD),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: const Color(0xFF67A5BE),
                ),
                child: const Icon(
                  Icons.check_circle,
                  color: Colors.white,
                  size: 150, // Tamaño del icono
                ),
              ),
              const SizedBox(height: 40),

              // Texto de confirmación
              const Text(
                'Tu reserva ha sido exitosa,\nte acompañamos en tus viajes',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),

              // Mostrar el código de la reserva
              Text(
                'Código de la reserva: $bookingCode',
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),

              // Botón para finalizar y volver al inicio
              ElevatedButton(
                onPressed: () {
                  // Navegar de regreso a la página de inicio o reserva
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => VehicleList()));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      const Color(0xFF4F889E), // Color personalizado
                  padding:
                      const EdgeInsets.symmetric(vertical: 12, horizontal: 30),
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(30), // Bordes redondeados
                  ),
                ),
                child: const Text(
                  'Finalizar',
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
    );
  }
}
