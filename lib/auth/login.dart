import 'package:ecomove_flutter_mobile/user_management/profile.dart';
import 'package:flutter/material.dart';
import 'register.dart';
import '/services/api_service.dart';
import 'package:provider/provider.dart';
import '../providers/user_provider.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  ApiService apiService = ApiService();

  bool isLoading = false;

  Future<void> _login() async {
    setState(() {
      isLoading = true; // Mostrar indicador de carga
    });

    final loginData = {
      'username': nameController.text,
      'password': passwordController.text,
    };

    try {
      final response = await apiService.login(loginData);
      print('Login exitoso: $response');

      // Guardar el username en el UserProvider
      Provider.of<UserProvider>(context, listen: false)
          .setUsername(nameController.text);

      Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context)=>ProfilePage())
      );

    } catch (e) {
      print('Error en login: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error al iniciar sesión')),
      );
    } finally {
      setState(() {
        isLoading = false;  // Ocultar indicador de carga
      });
    }


  }

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
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                ListTile(
                  title: Padding(
                    padding: const EdgeInsets.all(10),
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
                SizedBox(height: 20),
                TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                    hintText: 'Nombres',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 15,
                      horizontal: 10,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                TextField(
                  controller: passwordController,
                  obscureText: true, // Ocultar contraseña
                  decoration: InputDecoration(
                    hintText: 'Contraseña',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 15,
                      horizontal: 10,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                isLoading
                    ? CircularProgressIndicator() // Indicador de carga
                    : ElevatedButton(
                  onPressed: _login, // Ejecutar el login
                  child: Text('Ingresar'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.cyan[800],
                    foregroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(
                      vertical: 15,
                      horizontal: 25,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Register(),
                      ),
                    );
                  },
                  child: Text(
                    'Crear nueva cuenta',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.cyan[800],
                      fontWeight: FontWeight.bold,
                    ),
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

  @override
  void dispose() {
    nameController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
