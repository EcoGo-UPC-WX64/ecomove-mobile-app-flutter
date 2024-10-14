import 'package:flutter/material.dart';
import 'booking_reservation/reserva.dart'; // Importa la pantalla de reserva

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
      home: ReservaPage(), 
    );
  }
}
