import 'package:flutter/material.dart';
import 'register.dart';

void main() {
  runApp(MaterialApp(
    title: 'Ecomove',
    home: Login(),
  ));
}

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue[50],

      body: Center(
        child: Card(
          elevation: 4,
          margin: EdgeInsets.all(40),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0), // Padding para la Card
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                ListTile(
                  title: Padding(
                    padding: const EdgeInsets.all(10), // Menos padding aquí
                    child: Text(
                      'Login',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20), // Espacio entre el título y el campo de texto
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Nombres',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ), // Borde alrededor del campo
                    contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 10), // Padding interno
                  ),
                ),
                SizedBox(height: 20), // Espacio entre el campo de texto y el botón
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Contraseña',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ), // Borde alrededor del campo
                    contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 10), // Padding interno
                  ),
                ),
                SizedBox(height: 20), // Espacio adicional al final si deseas agregar más elementos
                ElevatedButton(
                  onPressed: () {},
                  child: Text('Ingresar'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.cyan[800],
                    foregroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 25), // Padding del botón
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ), // Bordes del botón
                  ),
                ),
                SizedBox(height: 20),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Register()) ,
                    );
                  },
                  child: Text('Crear nueva cuenta',
                      style: TextStyle(
                        fontSize: 18,
                          color: Colors.cyan[800],
                          fontWeight: FontWeight.bold)
                  ),
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
