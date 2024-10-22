import 'package:ecomove_flutter_mobile/vehicle_management/vehicle_list.dart';
import 'package:flutter/material.dart';

import '../custom_appBar.dart';

class AvailableVehicles extends StatelessWidget {
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
                'VEHÍCULOS DISPONIBLES',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              Container(
                alignment: Alignment.topRight,
                child:Column(

                  children: [
                    Row(
                      children: [
                        const Text(
                          'Vehículos Disponibles',
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                        SizedBox(width: 8.0),
                        const Text(
                          '10',
                          style: TextStyle(
                            fontSize: 15,
                            backgroundColor: Colors.white,
                          ),
                        ),
                      ],
                    ),

                    Row(
                      children: [
                        const Text(
                          'Scooters',
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                        SizedBox(width: 8.0),
                        const Text(
                          '7',
                          style: TextStyle(
                            fontSize: 15,
                            backgroundColor: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Text(
                          'Bicicletas',
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                        SizedBox(width: 8.0),
                        const Text(
                          '3',
                          style: TextStyle(
                            fontSize: 15,
                            backgroundColor: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
          DecoratedBox(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  border: Border.all(
                  color: Colors.white,
                  width: 500,
                  ),),
              child: const Text('Ubicación'),
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