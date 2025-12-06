// import 'dart:convert';
// import 'package:dealdine_application/features/auth/domain/entities/repositories/auth_repository.dart';
// import 'package:http/http.dart' as http;
// import '../../domain/entities/user.dart';

// class AuthRepositoryImpl implements AuthRepository {
//   final String baseUrl = "http://192.168.100.37:5000/api/auth";
//   @override
//   Future<User> signup(String name, String email, String password) async {
//     final response = await http.post(
//       Uri.parse('$baseUrl/signup'),
//       headers: {'Content-Type': 'application/json'},
//       body: jsonEncode({'name': name, 'email': email, 'password': password}),
//     );

//     final data = jsonDecode(response.body);
//     if (response.statusCode == 200) {
//       return User.fromJson(data['user']);
//     } else {
//       throw Exception(data['message']);
//     }
//   }
//   @override
//   Future<User> login(String email, String password) async {
//     final response = await http.post(
//       Uri.parse('$baseUrl/login'),
//       headers: {'Content-Type': 'application/json'},
//       body: jsonEncode({'email': email, 'password': password}),
//     );

//     final data = jsonDecode(response.body);
//     if (response.statusCode == 200) {
//       return User.fromJson(data['user']);
//     } else {
//       throw Exception(data['message']);
//     }
//   }

//   @override
//   Future<void> sendOtp(String email) async {
//     await http.post(
//       Uri.parse('$baseUrl/send-otp'),
//       headers: {'Content-Type': 'application/json'},
//       body: jsonEncode({'email': email}),
//     );
//   }

//   @override
//   Future<void> verifyOtp(String email, String otp) async {
//     await http.post(
//       Uri.parse('$baseUrl/verify-otp'),
//       headers: {'Content-Type': 'application/json'},
//       body: jsonEncode({'email': email, 'otp': otp}),
//     );
//   }

//   @override
//   Future<void> resetPassword(String email, String newPassword) async {
//     await http.post(
//       Uri.parse('$baseUrl/reset-password'),
//       headers: {'Content-Type': 'application/json'},
//       body: jsonEncode({'email': email, 'newPassword': newPassword}),
//     );
//   }
// }
// import 'package:dealdine_application/features/auth/domain/entities/repositories/auth_repository.dart';
// import 'package:dio/dio.dart';

// import '../../domain/entities/user.dart';

// import '../datasource/auth_api_service.dart';

// class AuthRepositoryImpl implements AuthRepository {
//   late final AuthApiService api;

//   AuthRepositoryImpl() {
//     final dio = Dio();
//     api = AuthApiService(dio);
//   }

//   @override
//   Future<User> signup(String name, String email, String password) {
//     return api.signup({
//       "name": name,
//       "email": email,
//       "password": password,
//     });
//   }

//   @override
//   Future<User> login(String email, String password) {
//     return api.login({
//       "email": email,
//       "password": password,
//     });
//   }

//   @override
//   Future<void> sendOtp(String email) async {
//     await api.sendOtp({"email": email});
//   }

//   @override
//   Future<void> verifyOtp(String email, String otp) async {
//     await api.verifyOtp({"email": email, "otp": otp});
//   }

//   @override
//   Future<void> resetPassword(String email, String newPassword) async {
//     await api.resetPassword({
//       "email": email,
//       "newPassword": newPassword,
//     });
//   }
// }

import 'dart:convert';
import 'package:dealdine_application/features/auth/domain/entities/repositories/auth_repository.dart';
import 'package:http/http.dart' as http;
import '../../domain/entities/user.dart';


class AuthRepositoryImpl implements AuthRepository {
  final String baseUrl = "http://192.168.100.37:5000/api/auth";

  @override
  Future<User> signup(String name, String email, String password) async {
    final response = await http.post(
      Uri.parse('$baseUrl/signup'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'name': name, 'email': email, 'password': password}),
    );

    final data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      return User.fromJson(data['user']);
    } else {
      throw Exception(data['message']);
    }
  }

  @override
  Future<User> login(String email, String password) async {
    final response = await http.post(
      Uri.parse('$baseUrl/login'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'email': email, 'password': password}),
    );

    final data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      return User.fromJson(data['user']);
    } else {
      throw Exception(data['message']);
    }
  }

  @override
  Future<void> sendOtp(String email) async {
    await http.post(
      Uri.parse('$baseUrl/send-otp'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'email': email}),
    );
  }

  @override
  Future<void> verifyOtp(String email, String otp) async {
    await http.post(
      Uri.parse('$baseUrl/verify-otp'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'email': email, 'otp': otp}),
    );
  }

  @override
  Future<void> resetPassword(String email, String newPassword) async {
    await http.post(
      Uri.parse('$baseUrl/reset-password'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'email': email, 'newPassword': newPassword}),
    );
  }
}