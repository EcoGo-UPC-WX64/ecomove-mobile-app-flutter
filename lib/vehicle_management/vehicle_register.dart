import 'package:flutter/material.dart';
import '../services/api_service.dart';
import '../shared/custom_returnAppBar.dart';
import '../user_management/profile.dart';

class VehicleRegisterScreen extends StatefulWidget {
  @override
  _VehicleRegisterScreenState createState() => _VehicleRegisterScreenState();
}

class _VehicleRegisterScreenState extends State<VehicleRegisterScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController batteryLevelController = TextEditingController();
  final TextEditingController latitudeController = TextEditingController();
  final TextEditingController longitudeController = TextEditingController();
  final TextEditingController statusController = TextEditingController();
  final TextEditingController imageUrlController = TextEditingController();
  final TextEditingController modelController = TextEditingController();

  final ApiService apiService = ApiService();

  int? ecoVehicleTypeId;

  void registerVehicle(BuildContext context) async {
    try {
      Map<String, dynamic> vehicleData = {
        "model": modelController.text,
        "ecoVehicleTypeId": ecoVehicleTypeId ?? 0,
        "batteryLevel": int.tryParse(batteryLevelController.text) ?? 0,
        "latitude": double.tryParse(latitudeController.text) ?? 0.0,
        "longitude": double.tryParse(longitudeController.text) ?? 0.0,
        "status": statusController.text,
        "imageUrl": imageUrlController.text,
        "ecoVehicleName": nameController.text,
        "userId": apiService.userId,
      };

      await apiService.registerVehicle(vehicleData);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Vehículo registrado exitosamente')),
      );
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ProfilePage()),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error al registrar el vehículo: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomReturnAppBar(),
      backgroundColor: Colors.lightBlue[50],
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'REGISTRO DE VEHICULO',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Ingresar los datos:',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 16),
                Container(
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 8,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      InputField(
                          label: 'Nombre del vehículo',
                          controller: nameController),
                      InputField(
                          label: 'Modelo del vehículo',
                          controller: modelController),
                      Text(
                        'Tipo de Vehículo:',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black54,
                        ),
                      ),
                      SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ChoiceButton(
                            label: 'Scooter',
                            isSelected: ecoVehicleTypeId == 1,
                            onTap: () {
                              setState(() {
                                ecoVehicleTypeId = 1;
                              });
                            },
                          ),
                          SizedBox(width: 16),
                          ChoiceButton(
                            label: 'Bicicleta',
                            isSelected: ecoVehicleTypeId == 2,
                            onTap: () {
                              setState(() {
                                ecoVehicleTypeId = 2;
                              });
                            },
                          ),
                        ],
                      ),
                      InputField(
                          label: 'Nivel de batería (%)',
                          controller: batteryLevelController),
                      InputField(
                          label: 'Latitud', controller: latitudeController),
                      InputField(
                          label: 'Longitud', controller: longitudeController),
                      InputField(label: 'Estado', controller: statusController),
                      InputField(
                          label: 'URL de Imagen del vehículo',
                          controller: imageUrlController),
                      SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: () => registerVehicle(context),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF4F889E),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          padding: EdgeInsets.symmetric(
                            horizontal: 24,
                            vertical: 12,
                          ),
                        ),
                        child: Text(
                          'Mandar Solicitud',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class InputField extends StatelessWidget {
  final String label;
  final TextEditingController controller;

  const InputField({required this.label, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(
            color: Colors.black54,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Color(0xFF4F889E), width: 1.5),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Color(0xFF4F889E), width: 1.5),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Color(0xFF4F889E), width: 1.5),
          ),
          fillColor: Colors.transparent,
          filled: true,
          contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        ),
      ),
    );
  }
}

class ChoiceButton extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const ChoiceButton({
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? Color(0xFF4F889E) : Colors.grey[200],
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: isSelected ? Color(0xFF4F889E) : Colors.grey,
          ),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 16,
            color: isSelected ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }
}
