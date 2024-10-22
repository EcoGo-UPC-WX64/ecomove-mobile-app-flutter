import 'package:ecomove_flutter_mobile/vehicle_management/available_vehicles.dart';
import 'package:flutter/material.dart';

import '../custom_appBar.dart';

class VehicleLocation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: Container(
        color: const Color(0xFFE6F4FB),
        // Color de fondo del cuerpo
        padding: const EdgeInsets.symmetric(horizontal: 36.0, vertical: 64.0),
        // Espaciado general,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'UBICACIÓN DE SCOOTERS ELÉCTRICOS O BICICLETAS',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 36),
              GestureDetector(
                child: Image.asset(
                  'lib/assets/images/map.png',
                  // Usa el icono personalizado desde el path
                  height: 400, // Tamaño del icono
                  width: 500,
                ),
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AvailableVehicles()),);
                }
              ),
              const SizedBox(height: 10),
              const Text(
                'En el mapa que se ha mostrado con anterioridad se puede evidenciar las bicicletas y scooters eléctricos que estan disponibles para uso de nuestros usuarios. Asimismo, se muestra un punto concurrido en el cual siempre se podran encontrar estos vehículos a disponibilidad del usuario.',
                style: TextStyle(
                  fontSize: 20,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 100),
            ],
          ),
        ),
      ),
    );
  }
}