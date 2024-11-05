import 'package:flutter/material.dart';
import '../services/api_service.dart';
import '../shared/custom_returnAppBar.dart'; // Asegúrate de importar tu ApiService

class RegisteredVehicles extends StatefulWidget {
  @override
  _RegisteredVehiclesState createState() => _RegisteredVehiclesState();
}

class _RegisteredVehiclesState extends State<RegisteredVehicles> {
  late Future<List<dynamic>> _vehiclesFuture;
  final ApiService apiService = ApiService(); // Crear instancia de ApiService

  @override
  void initState() {
    super.initState();
    _vehiclesFuture = fetchVehicles();
    print('vehicles fetched: $_vehiclesFuture');
  }

  Future<List<dynamic>> fetchVehicles() async {
    print(apiService.userId);
    print(apiService.auth);
    int? userId = apiService.userId; // Obtener el userId directamente del ApiService
    if (userId == null) {
      throw Exception('User ID is not available.');
    }
    return await apiService.getVehiclesByUserId(userId); // Usar el método del servicio
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue[50],
      appBar: const CustomReturnAppBar(),
      body: FutureBuilder<List<dynamic>>(
        future: _vehiclesFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
            List<dynamic> vehicles = snapshot.data!;

            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(60),
                  child: Text(
                    'Vehículos Registrados'.toUpperCase(),
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 40.0),
                    itemCount: vehicles.length + 1,
                    itemBuilder: (context, index) {
                      if (index < vehicles.length) {
                        final vehicle = vehicles[index];
                        return Card(
                          elevation: 4,
                          margin: const EdgeInsets.only(bottom: 20),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                SizedBox(height: 20),
                                Text(
                                  'Nombre:',
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.black,
                                  ),
                                ),
                                Text(
                                  vehicle['ecoVehicleName'] ?? '',
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 10),
                                Text(
                                  'Modelo:',
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.black,
                                  ),
                                ),
                                Text(
                                  vehicle['model'] ?? '', // Mostrar el modelo del vehículo
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 20),
                              ],
                            ),
                          ),
                        );
                      } else {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          child: ElevatedButton(
                            onPressed: () {
                              // Lógica para agregar un nuevo vehículo
                            },
                            child: Text('Agregar nuevo vehículo'),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.cyan[800],
                              foregroundColor: Colors.white,
                              padding: EdgeInsets.symmetric(vertical: 15, horizontal: 25),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50),
                              ),
                            ),
                          ),
                        );
                      }
                    },
                  ),
                ),
              ],
            );
          } else {
            return Center(child: Text('No hay vehículos registrados.'));
          }
        },
      ),
    );
  }
}
