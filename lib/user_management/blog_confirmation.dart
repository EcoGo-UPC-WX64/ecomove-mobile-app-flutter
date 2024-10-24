import 'package:ecomove_flutter_mobile/user_management/profile.dart';
import 'package:flutter/material.dart';

class BlogConfirmation extends StatelessWidget {
  const BlogConfirmation({super.key});

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
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFF67A5BE),
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
                'Tu plubliacación se ha subido correctamente',
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
                  Navigator.popUntil(context, ModalRoute.withName('/'));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF4F889E), // Color personalizado
                  padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 30),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30), // Bordes redondeados
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
