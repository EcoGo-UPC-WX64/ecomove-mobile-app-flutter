import 'package:flutter/material.dart';
import 'booking_reservation/alquilar_vehiculo.dart'; 
import 'booking_reservation/reserva.dart';
import 'booking_reservation/confirmacion.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Reserva de Vehículos',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      // Usa onGenerateRoute para manejar las rutas dinámicas
      onGenerateRoute: (settings) {
        if (settings.name == '/confirmacion') {
          final bookingCode = settings.arguments as String; // Recibe el bookingCode desde los argumentos
          return MaterialPageRoute(
            builder: (context) {
              return ConfirmacionPage(bookingCode: bookingCode); // Pasa el argumento a la página
            },
          );
        }
        // Define otras rutas
        switch (settings.name) {
          case '/':
            return MaterialPageRoute(builder: (context) => const ReservaPage());
          case '/alquilar':
            return MaterialPageRoute(builder: (context) => const AlquilarVehiculoPage());
          default:
            return null;
        }
      },
      initialRoute: '/',
    );
  }
}
