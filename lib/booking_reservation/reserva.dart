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
    // Color personalizado para los bordes y el botón
    const Color customColor = Color(0xFF4F889E);

    return Scaffold(
      backgroundColor: const Color(0xFFE3F2FD),
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
              
              // Relleno para el recuadro blanco
              Container(
                padding: const EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  color: Colors.white, // Fondo blanco para el formulario
                  borderRadius: BorderRadius.circular(20), // Bordes redondeados
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
                    // Campo de selección de fecha de inicio con etiquetas en negro
                    TextFormField(
                      readOnly: true,
                      decoration: InputDecoration(
                        labelText: 'Fecha inicio',
                        labelStyle: const TextStyle(color: Colors.black), // Color de la etiqueta en estado normal
                        floatingLabelStyle: const TextStyle(color: Colors.black), 
                        suffixIcon: const Icon(Icons.calendar_today), // Icono predeterminado
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: customColor, width: 2), // Bordes con color personalizado
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: customColor, width: 2), // Bordes con color personalizado al enfocar
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
                        labelStyle: const TextStyle(color: Colors.black), // Color de la etiqueta en estado normal
                        floatingLabelStyle: const TextStyle(color: Colors.black), // Color de la etiqueta cuando el campo está enfocado
                        suffixIcon: const Icon(Icons.calendar_today), // Icono predeterminado
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: customColor, width: 2), // Bordes con color personalizado
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: customColor, width: 2), // Bordes con color personalizado al enfocar
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
                        labelStyle: const TextStyle(color: Colors.black), // Color de la etiqueta en estado normal
                        floatingLabelStyle: const TextStyle(color: Colors.black), // Color de la etiqueta cuando el campo está enfocado
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: customColor, width: 2), // Bordes con color personalizado
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: customColor, width: 2), // Bordes con color personalizado al enfocar
                        ),
                        contentPadding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 12.0),
                      ),
                    ),
                    const SizedBox(height: 20),

                    SizedBox(
                      width: 180, 
                      child: ElevatedButton(
                        onPressed: () {
                          debugPrint('Reserva confirmada');
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: customColor, // Color personalizado para el botón
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30), // Bordes más redondeados
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
