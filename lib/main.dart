import 'package:flutter/material.dart';
//import 'booking_reservation/alquilar_vehiculo.dart'; // Importa la nueva pantalla de alquilar vehículo
//import 'booking_reservation/reserva.dart'; // Importa la pantalla de reserva
//import 'booking_reservation/confirmacion.dart';
import 'booking_reservation/historial_viajes.dart';

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
      //home: AlquilarVehiculoPage(),
      //home: ReservaPage(),
      //home: ConfirmacionPage(),
      home: HistorialViajesPage(),
    );
  }
}
