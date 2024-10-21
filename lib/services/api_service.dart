import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiService {
  final String baseUrl = "https://ecomove-api.azurewebsites.net/api/v1";

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
      return json.decode(response.body);
    } else {
      throw Exception('Error al iniciar sesión: ${response.statusCode} - ${response.body}');
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
      throw Exception('Error al registrar el usuario: ${response.statusCode} - ${response.body}');
    }
  }




  // Método para crear una reserva
  Future<dynamic> createBooking(Map<String, dynamic> bookingData) async {
    final response = await http.post(
      Uri.parse('$baseUrl/bookings'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(bookingData),
    );

    print('Status code: ${response.statusCode}');
    print('Response body: ${response.body}');

    if (response.statusCode == 201) {
      return json.decode(response.body); // Si la reserva es creada correctamente
    } else {
      throw Exception('Error al crear la reserva: ${response.statusCode} - ${response.body}');
    }
  }

  // Método para obtener todas las reservas
  Future<List<dynamic>> getAllBookings() async {
    final response = await http.get(Uri.parse('$baseUrl/bookings'));

    print('Status code: ${response.statusCode}');
    print('Response body: ${response.body}');

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Error al obtener las reservas: ${response.statusCode} - ${response.body}');
    }
  }

  // Método para obtener una reserva por su ID
  Future<dynamic> getBookingById(int id) async {
    final response = await http.get(Uri.parse('$baseUrl/bookings/$id'));

    print('Status code: ${response.statusCode}');
    print('Response body: ${response.body}');

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Error al obtener la reserva por ID: ${response.statusCode} - ${response.body}');
    }
  }

  // Método para obtener reservas por ID de usuario
  Future<List<dynamic>> getBookingsByUserId(int userId) async {
    final response = await http.get(Uri.parse('$baseUrl/bookings/user-id/$userId'));

    print('Status code: ${response.statusCode}');
    print('Response body: ${response.body}');

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Error al obtener las reservas por usuario: ${response.statusCode} - ${response.body}');
    }
  }
}