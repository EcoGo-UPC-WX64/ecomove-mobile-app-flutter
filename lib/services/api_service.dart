import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/material.dart';

class ApiService with ChangeNotifier {
  static final ApiService _instance = ApiService._internal();

  factory ApiService() {
    return _instance;
  }

  ApiService._internal();

  final String baseUrl = "https://ecomove-api.azurewebsites.net/api/v1";

  String? _auth;
  int? _userId;
  String? get auth => _auth;
  int? get userId => _userId;

  // Método para realizar una solicitud GET con el token de autorización
  Future<http.Response> _getRequest(String endpoint) async {
    return await http.get(
      Uri.parse('$baseUrl$endpoint'),
      headers: <String, String>{
        'Authorization': 'Bearer $auth',
      },
    );
  }

  // Método para realizar una solicitud POST con el token de autorización
  Future<http.Response> _postRequest(
      String endpoint, Map<String, dynamic> data) async {
    return await http.post(
      Uri.parse('$baseUrl$endpoint'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $auth',
      },
      body: jsonEncode(data),
    );
  }

  // Método para iniciar sesión
  Future<dynamic> login(Map<String, dynamic> loginData) async {
    final response = await http.post(
      Uri.parse('$baseUrl/authentication/sign-in'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(loginData),
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      final responseData = json.decode(response.body);
      _auth = responseData['token'];
      _userId = responseData['userId'];
      notifyListeners();
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

    if (response.statusCode == 201 || response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception(
          'Error al registrar el usuario: ${response.statusCode} - ${response.body}');
    }
  }

  // Método para obtener todos los vehículos por userId
  Future<List<dynamic>> getVehiclesByUserId(int userId) async {
    if (_userId == null) {
      throw Exception('ID de usuario no disponible');
    }

    final response = await _getRequest('/eco-vehicles/userid/$userId');

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception(
          'Error al obtener los vehículos por userId: ${response.statusCode} - ${response.body}');
    }
  }

  // Método para obtener todos los vehículos
  Future<List<Map<String, dynamic>>> getVehicles() async {
    final response = await http.get(
      Uri.parse('$baseUrl/eco-vehicles'),
      headers: <String, String>{
        'Content-Type': 'application/json',
        if (auth != null) 'Authorization': 'Bearer $auth',
      },
    );

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((vehicle) => vehicle as Map<String, dynamic>).toList();
    } else {
      throw Exception(
          'Error al obtener la lista de vehículos: ${response.statusCode} - ${response.body}');
    }
  }

  // Método para registrar un vehículo
  /*Future<void> registerVehicle(Map<String, dynamic> vehicleData, String? authToken) async {
    final response = await http.post(
      Uri.parse('$baseUrl/eco-vehicles'),
      headers: {
        'Content-Type': 'application/json',
        if (authToken != null) 'Authorization': 'Bearer $authToken',
      },
      body: jsonEncode(vehicleData),
    );

    if (response.statusCode != 201 && response.statusCode != 200) {
      throw Exception(
          'Error al registrar el vehículo: ${response.statusCode} - ${response.body}');
    }
  }*/

  Future<void> registerVehicle(Map<String, dynamic> vehicleData) async {
    final response = await _postRequest('/eco-vehicles', vehicleData);

    if (response.statusCode != 201 && response.statusCode != 200) {
      throw Exception(
          'Error al registrar el vehículo: ${response.statusCode} - ${response.body}');
    }
  }

  // Método para publicar un blog
  Future<void> postBlogs(Map<String, dynamic> blogData) async {
    final response = await _postRequest('/blog', blogData);

    if (response.statusCode != 201 && response.statusCode != 200) {
      throw Exception(
          'Error al publicar el blog: ${response.statusCode} - ${response.body}');
    }
  }

  // Método para crear una reserva
  Future<void> createBooking(Map<String, dynamic> bookingData) async {
    final response = await _postRequest('/bookings', bookingData);

    if (response.statusCode != 201 && response.statusCode != 200) {
      throw Exception(
          'Error al crear la reserva: ${response.statusCode} - ${response.body}');
    }
  }

  // Método para obtener blogs
  Future<List<Map<String, dynamic>>> getBlogs() async {
    final response = await http.get(
      Uri.parse('$baseUrl/blog'),
      headers: <String, String>{
        'Content-Type': 'application/json',
        if (auth != null) 'Authorization': 'Bearer $auth',
      },
    );

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((blog) => blog as Map<String, dynamic>).toList();
    } else {
      throw Exception(
          'Error al obtener la lista de blogs: ${response.statusCode} - ${response.body}');
    }
  }
}
