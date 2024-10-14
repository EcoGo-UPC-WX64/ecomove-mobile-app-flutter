import 'package:flutter/material.dart';

class HistorialViajesPage extends StatelessWidget {
   HistorialViajesPage({super.key});

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

            // Lista de viajes
            Expanded(
              child: ListView.builder(
                itemCount: 6, // Número de elementos en la lista
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
                        subtitle: Text(_fechas[index]),
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

  // Fechas de ejemplo
  final List<String> _fechas = [
    '01/12/24',
    '29/11/24',
    '29/11/24',
    '28/11/24',
    '27/11/24',
    '26/11/24',
  ];
}
