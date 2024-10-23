import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiService {
  final String baseUrl = "https://ecomove-api.azurewebsites.net/api/v1";
  String? auth;

  // Método para iniciar sesión
  Future<dynamic> login(Map<String, dynamic> loginData) async {
    final response = await http.post(
      Uri.parse('$baseUrl/authentication/sign-in'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(loginData),
    );

    print('Status code: ${response.statusCode}');
    print('Response body: ${response.body}');

    if (response.statusCode == 200 || response.statusCode == 201) {
      final responseData = json.decode(response.body);
      auth = responseData['token'];
      return responseData;
    } else {
      throw Exception(
          'Error al iniciar sesión: ${response.statusCode} - ${response.body}');
    }
  }

  // Método para registrar un usuario
  Future<dynamic> registerUser(Map<String, dynamic> userData) async {
    final response = await http.post(
      Uri.parse('$baseUrl/authentication/sign-up'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(userData),
    );

    print('Status code: ${response.statusCode}');
    print('Response body: ${response.body}');

    if (response.statusCode == 201 || response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception(
          'Error al registrar el usuario: ${response.statusCode} - ${response
              .body}');
    }
  }
}
