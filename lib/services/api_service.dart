import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiService {
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
        'Authorization': 'Bearer $auth', // Token de autorización
      },
    );
  }

  // Método para realizar una solicitud POST con el token de autorización
  Future<http.Response> _postRequest(String endpoint,
      Map<String, dynamic> data) async {
    return await http.post(
      Uri.parse('$baseUrl$endpoint'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $auth', // Token de autorización
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

    print('Status code: ${response.statusCode}');
    print('Response body: ${response.body}');

    if (response.statusCode == 200 || response.statusCode == 201) {
      final responseData = json.decode(response.body);
      _auth = responseData['token'];
      _userId = responseData['userId'];
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

  // Método para crear una reserva
  Future<dynamic> createBooking(Map<String, dynamic> bookingData) async {
    try {
      final response = await _postRequest('/bookings', bookingData);

      if (response.statusCode == 201) {
        return json.decode(response.body);
      } else {
        throw Exception(
            'Error al crear la reserva: ${response.statusCode} - ${response
                .body}');
      }
    } catch (error) {
      throw Exception('Error al conectar con el servidor: $error');
    }
  }

  // Método para obtener todas las reservas
  Future<List<dynamic>> getAllBookings() async {
    final response = await _getRequest('/bookings');

    print('Status code: ${response.statusCode}');
    print('Response body: ${response.body}');

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception(
          'Error al obtener las reservas: ${response.statusCode} - ${response
              .body}');
    }
  }

  // Método para obtener una reserva por su ID
  Future<dynamic> getBookingById(int id) async {
    final response = await _getRequest('/bookings/$id');

    print('Status code: ${response.statusCode}');
    print('Response body: ${response.body}');

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception(
          'Error al obtener la reserva por ID: ${response
              .statusCode} - ${response.body}');
    }
  }

  // Método para obtener reservas por ID de usuario
  Future<List<dynamic>> getBookingsByUserId(int userId) async {
    final response = await _getRequest('/bookings/user-id/$userId');

    print('Status code: ${response.statusCode}');
    print('Response body: ${response.body}');

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception(
          'Error al obtener las reservas por usuario: ${response
              .statusCode} - ${response.body}');
    }
  }

  // Método para obtener todos los vehículos por userId
  Future<List<dynamic>> getVehiclesByUserId(int userId) async {
    if (_userId == null) {
      throw Exception('ID de usuario no disponible');
    }

    final response = await _getRequest('/eco-vehicles/userid/$userId');

    print('Status code: ${response.statusCode}');
    print('Response body: ${response.body}');

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception(
          'Error al obtener los vehículos por userId: ${response
              .statusCode} - ${response.body}');
    }
  }
}
