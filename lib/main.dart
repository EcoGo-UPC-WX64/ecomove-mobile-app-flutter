import 'package:flutter/material.dart';
import 'booking_reservation/alquilar_vehiculo.dart'; // Importa la nueva pantalla de alquilar vehículo

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
      // Cambia `home` a `AlquilarVehiculoPage` si deseas mostrar esa pantalla primero
      home: AlquilarVehiculoPage(), 
    );
  }
}
