import 'package:flutter/material.dart';

class ConfirmacionReservaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Icono de check dentro de un círculo
            Container(
              padding: EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.blueGrey,
              ),
              child: Icon(
                Icons.check_circle_outline,
                size: 100.0,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 20.0),
            Text(
              'Tu pago se ha realizado con éxito',
              style: TextStyle(fontSize: 18.0),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.lightBlue[50],
    );
  }
}
