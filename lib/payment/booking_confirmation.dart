import 'package:flutter/material.dart';

import '../user_management/profile.dart';

class ConfirmacionPagoPage extends StatelessWidget {
  const ConfirmacionPagoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE3F2FD), // Fondo azul claro
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
                'Tu pago se ha realizado con éxito',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),

              // Botón para finalizar y volver al inicio
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ProfilePage()));
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
