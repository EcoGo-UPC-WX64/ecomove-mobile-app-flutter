import 'package:ecomove_flutter_mobile/custom_appBar.dart';
import 'package:flutter/material.dart';

class ReservaPage extends StatefulWidget {
  const ReservaPage({super.key});

  @override
  _ReservaPageState createState() => _ReservaPageState();
}

class _ReservaPageState extends State<ReservaPage> {
  DateTime? _fechaInicio;
  DateTime? _fechaFin;
  final TextEditingController _distritoController = TextEditingController();

  Future<void> _selectDate(BuildContext context, bool isFechaInicio) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2022),
      lastDate: DateTime(2025),
    );

    if (picked != null) {
      setState(() {
        if (isFechaInicio) {
          _fechaInicio = picked;
        } else {
          _fechaFin = picked;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    const Color customColor = Color(0xFF4F889E);

    return Scaffold(
      backgroundColor: const Color(0xFFE3F2FD),
      appBar: const CustomAppBar(),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'RESERVA',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 10,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextFormField(
                      readOnly: true,
                      decoration: InputDecoration(
                        labelText: 'Fecha inicio',
                        labelStyle: const TextStyle(color: Colors.black),
                        floatingLabelStyle: const TextStyle(color: Colors.black),
                        suffixIcon: const Icon(Icons.calendar_today),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: customColor, width: 2),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: customColor, width: 2),
                        ),
                        contentPadding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 12.0),
                      ),
                      onTap: () => _selectDate(context, true),
                      controller: TextEditingController(
                        text: _fechaInicio != null
                            ? "${_fechaInicio!.month}/${_fechaInicio!.day}/${_fechaInicio!.year}"
                            : '',
                      ),
                    ),
                    const SizedBox(height: 16),
                    
                    TextFormField(
                      readOnly: true,
                      decoration: InputDecoration(
                        labelText: 'Fecha fin',
                        labelStyle: const TextStyle(color: Colors.black),
                        floatingLabelStyle: const TextStyle(color: Colors.black),
                        suffixIcon: const Icon(Icons.calendar_today),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: customColor, width: 2),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: customColor, width: 2),
                        ),
                        contentPadding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 12.0),
                      ),
                      onTap: () => _selectDate(context, false),
                      controller: TextEditingController(
                        text: _fechaFin != null
                            ? "${_fechaFin!.month}/${_fechaFin!.day}/${_fechaFin!.year}"
                            : '',
                      ),
                    ),
                    const SizedBox(height: 16),
                    
                    TextFormField(
                      controller: _distritoController,
                      decoration: InputDecoration(
                        labelText: 'Distrito',
                        labelStyle: const TextStyle(color: Colors.black),
                        floatingLabelStyle: const TextStyle(color: Colors.black),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: customColor, width: 2),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: customColor, width: 2),
                        ),
                        contentPadding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 12.0),
                      ),
                    ),
                    const SizedBox(height: 20),

                    SizedBox(
                      width: 180, 
                      child: ElevatedButton(
                        onPressed: () {
                          // Al presionar, navega a la pantalla de alquilar vehículo
                          Navigator.pushNamed(context, '/alquilar');
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: customColor,
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        child: const Text(
                          'Comenzar reserva',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                          ),
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
    );
  }
}
