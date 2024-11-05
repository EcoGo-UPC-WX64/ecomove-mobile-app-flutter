import 'package:flutter/material.dart';
import '../services/api_service.dart';

class VehicleRegisterScreen extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController typeController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController notesController = TextEditingController();
  final TextEditingController imageUrlController = TextEditingController();

  final ApiService apiService = ApiService();

  void registerVehicle(BuildContext context) async {
    try {
      Map<String, dynamic> vehicleData = {
        "ecoVehicleName": nameController.text,
        "ecoVehicleTypeId": int.tryParse(typeController.text) ?? 0,
        "userEmail": emailController.text,
        "notes": notesController.text,
        "imageUrl": imageUrlController.text,
      };

      await apiService.registerVehicle(vehicleData, null); // null es el authToken (reemplázalo si tienes uno)
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Vehículo registrado exitosamente')),
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
      backgroundColor: Colors.lightBlue[50], // Fondo general claro
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32.0), // Ajuste de ancho
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
                    color: Colors.black, // Color negro
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
                      InputField(label: 'Nombre del vehículo', controller: nameController),
                      InputField(label: 'Tipo de Vehículo', controller: typeController),
                      InputField(label: 'Correo del propietario', controller: emailController),
                      InputField(label: 'Indicaciones extras', controller: notesController),
                      InputField(label: 'Subir Imagen del vehículo', controller: imageUrlController),
                      SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: () => registerVehicle(context),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF4F889E), // Color especificado del botón
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
                            color: Colors.white, // Color del texto en blanco
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
            borderRadius: BorderRadius.circular(10), // Bordes redondeados
            borderSide: BorderSide(color: Color(0xFF4F889E), width: 1.5), // Borde de color especificado
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Color(0xFF4F889E), width: 1.5), // Borde cuando no está enfocado
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Color(0xFF4F889E), width: 1.5), // Borde cuando está enfocado
          ),
          fillColor: Colors.transparent, // Sin color de fondo
          filled: true,
          contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        ),
      ),
    );
  }
}
