import 'package:flutter/material.dart';
import 'booking_reservation/alquilar_vehiculo.dart'; 
import 'booking_reservation/reserva.dart';
import 'booking_reservation/confirmacion.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Reserva de Vehículos',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      // Definir rutas
      initialRoute: '/',
      routes: {
        '/': (context) => ReservaPage(), // Página principal de reserva
        '/alquilar': (context) => AlquilarVehiculoPage(), // Página de alquilar vehículo
        '/confirmacion': (context) => ConfirmacionPage(), // Página de confirmación
      },
    );
  }
}
