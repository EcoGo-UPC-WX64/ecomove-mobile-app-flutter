import 'package:ecomove_flutter_mobile/customer_support/alerta_seguridad.dart';
import 'package:ecomove_flutter_mobile/customer_support/soporte.dart';
import 'package:flutter/material.dart';
import 'payment/metodo_pago.dart'; // Importa la vista del método de pago

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //home: SoportePage(),
      home: AlertaSeguridadPage(),
    );
  }
}
