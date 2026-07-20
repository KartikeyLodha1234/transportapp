class LoginRequest {
  final String email;
  final String password;

  LoginRequest({
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toJson() => {
    'email': email,
    'password': password,
  };
}

class LoginResponse {
  final bool success;
  final String message;
  final String? token;
  final String? role;
  final UserData? user;

  LoginResponse({
    required this.success,
    required this.message,
    this.token,
    this.role,
    this.user,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      success: json['success'] ?? false,
      message: json['message'] ?? '',
      token: json['token'],
      role: json['role'],
      user: json['user'] != null ? UserData.fromJson(json['user']) : null,
    );
  }
}

class UserData {
  final int? id;
  final String name;
  final String email;
  final String role;
  final String? phone;

  UserData({
    this.id,
    required this.name,
    required this.email,
    required this.role,
    this.phone,
  });

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      id: json['id'],
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      role: json['role'] ?? 'driver',
      phone: json['phone'],
    );
  }
}