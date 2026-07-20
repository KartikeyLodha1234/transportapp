import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/auth_models.dart';

class AuthService {
  static const String baseUrl = 'http://localhost:8001'; // Use your IP for physical device
  static const String loginEndpoint = '/api/auth/login';

  Future<LoginResponse> login(String email, String password) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl$loginEndpoint'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        body: jsonEncode(LoginRequest(email: email, password: password).toJson()),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return LoginResponse.fromJson(data);
      } else {
        // Handle non-200 responses
        final errorData = jsonDecode(response.body);
        return LoginResponse(
          success: false,
          message: errorData['detail'] ?? 'Login failed',
        );
      }
    } catch (e) {
      // Network error or other exceptions
      return LoginResponse(
        success: false,
        message: 'Server not reachable. Please make sure backend server is running on port 8001.',
      );
    }
  }
}