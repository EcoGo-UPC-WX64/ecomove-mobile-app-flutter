import 'package:flutter/material.dart';

class ConfirmacionReservaPage extends StatelessWidget {
  const ConfirmacionReservaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Icono de check dentro de un círculo
            Container(
              padding: const EdgeInsets.all(20.0),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.blueGrey,
              ),
              child: const Icon(
                Icons.check_circle_outline,
                size: 100.0,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 20.0),
            const Text(
              'Tu pago se ha realizado con éxito',
              style: TextStyle(fontSize: 18.0),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.lightBlue[50],
    );
  }
}
