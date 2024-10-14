import 'package:flutter/material.dart';

class AlquilarVehiculoPage extends StatefulWidget {
  const AlquilarVehiculoPage({super.key});

  @override
  _AlquilarVehiculoPageState createState() => _AlquilarVehiculoPageState();
}

class _AlquilarVehiculoPageState extends State<AlquilarVehiculoPage> {
  String _codigo = "47273";

  void _regenerarCodigo() {
    // Aquí puedes implementar la lógica para generar un nuevo código
    setState(() {
      _codigo = (int.parse(_codigo) + 1).toString(); // Ejemplo de regeneración
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE3F2FD), // Color de fondo claro
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Texto principal
              const Text(
                'Introduce este código para poder usar el vehículo',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),
              
              // Contenedor del código
              Container(
                padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                    color: Colors.black,
                    width: 2, // Borde negro para el código
                  ),
                ),
                child: Text(
                  '#$_codigo',
                  style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Botón para regenerar el código
              ElevatedButton(
                onPressed: _regenerarCodigo,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF4F889E), // Color personalizado
                  padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 30),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30), // Bordes redondeados
                  ),
                ),
                child: const Text(
                  'Volver a generar',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
