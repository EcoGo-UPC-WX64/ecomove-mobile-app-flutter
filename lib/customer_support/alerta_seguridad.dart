import 'package:flutter/material.dart';

import '../shared/custom_returnAppBar.dart';

class AlertaSeguridadPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomReturnAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(
                child: Text(
                  'ALERTAS',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 30),
              const Text(
                'Avisos de seguridad',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  bulletPoint(
                      'Siempre use casco y equipo de protección al andar en bicicletas o scooters eléctricos.'),
                  bulletPoint(
                      'Respete las normas de tráfico y circule por carriles designados cuando esté en la vía pública.'),
                  bulletPoint(
                      'Antes de comenzar su viaje, asegúrese de que la bicicleta o el scooter estén en condiciones seguras de funcionamiento.'),
                ],
              ),
              const SizedBox(height: 30),
              const Text(
                'Consejos de uso de vehículos',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  bulletPoint(
                      'Antes de comenzar su viaje, verifique la carga de la batería para evitar quedarse sin energía en el camino.'),
                  bulletPoint(
                      'Mantenga una velocidad segura y adecuada para las condiciones del entorno en el que se encuentre.'),
                  bulletPoint(
                      'Estacione los vehículos en áreas designadas y seguras para evitar obstrucciones y garantizar la accesibilidad para otros usuarios.'),
                ],
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.lightBlue[50],
    );
  }

  Widget bulletPoint(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("• ", style: TextStyle(fontSize: 16)),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(fontSize: 16.0),
              textAlign: TextAlign.justify,
            ),
          ),
        ],
      ),
    );
  }
}
