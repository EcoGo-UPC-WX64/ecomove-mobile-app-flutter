import 'package:flutter/material.dart';

class SoportePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  'SOPORTE AL CLIENTE',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 30),
              Text(
                'Problemas técnicos',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Si estás experimentando algún problema técnico con la plataforma EcoGo, como dificultades para registrarte, errores al reservar un vehículo o problemas de acceso a la aplicación, estamos aquí para ayudarte. Nuestro equipo técnico está comprometido en solucionar cualquier inconveniente que puedas tener para garantizar una experiencia fluida y satisfactoria.',
                style: TextStyle(fontSize: 16.0),
                textAlign: TextAlign.justify,
              ),
              SizedBox(height: 30),
              Text(
                'Consultas',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Text(
                '¿Tienes preguntas sobre cómo funciona EcoGo, cómo registrarte como usuario, cómo reservar un vehículo o cualquier otra consulta relacionada con nuestros servicios? ¡Estamos aquí para responderlas! Nuestro equipo de atención al cliente está disponible para brindarte toda la información que necesites y ayudarte a sacar el máximo provecho de nuestra plataforma de movilidad sostenible.',
                style: TextStyle(fontSize: 16.0),
                textAlign: TextAlign.justify,
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.lightBlue[50],
    );
  }
}
