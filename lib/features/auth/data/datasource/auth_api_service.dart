// import 'package:dealdine_application/features/auth/domain/entities/user.dart';
// import 'package:dio/dio.dart';
// import 'package:retrofit/retrofit.dart';

// part 'auth_api_service.g.dart';

// @RestApi(baseUrl: "http://192.168.100.32:5000/api/auth")
// abstract class AuthApiService {
//   factory AuthApiService(Dio dio, {String baseUrl}) = _AuthApiService;

//   @POST("/signup")
//   Future<User> signup(@Body() Map<String, dynamic> body);

//   @POST("/login")
//   Future<User> login(@Body() Map<String, dynamic> body);

//   @POST("/send-otp")
//   Future<Map<String, dynamic>> sendOtp(@Body() Map<String, dynamic> body);

//   @POST("/verify-otp")
//   Future<Map<String, dynamic>> verifyOtp(@Body() Map<String, dynamic> body);

//   @POST("/reset-password")
//   Future<Map<String, dynamic>> resetPassword(@Body() Map<String, dynamic> body);
// }
// import 'package:dealdine_application/features/auth/domain/entities/user.dart';

// import 'user.dart';
// import 'package:retrofit/retrofit.dart';
// import 'package:dio/dio.dart';

// part 'auth_api_service.g.dart';

// @RestApi(baseUrl: "http://192.168.100.32:5000/api/auth")
// abstract class AuthApiService {
//   factory AuthApiService(Dio dio, {String baseUrl}) = _AuthApiService;

//   @POST("/signup")
//   Future<User> signup(@Body() Map<String, dynamic> body);

//   @POST("/login")
//   Future<User> login(@Body() Map<String, dynamic> body);

//   @POST("/send-otp")
//   Future<Map<String, dynamic>> sendOtp(@Body() Map<String, dynamic> body);

//   @POST("/verify-otp")
//   Future<Map<String, dynamic>> verifyOtp(@Body() Map<String, dynamic> body);

//   @POST("/reset-password")
//   Future<Map<String, dynamic>> resetPassword(@Body() Map<String, dynamic> body);
// }
// import 'package:dealdine_application/features/auth/domain/entities/user.dart';
// import 'package:retrofit/retrofit.dart';
// import 'package:dio/dio.dart';

// part 'auth_api_service.g.dart';

// @RestApi(baseUrl: "http://192.168.100.32:5000/api/auth")
// abstract class AuthApiService {
//   factory AuthApiService(Dio dio, {String baseUrl}) = _AuthApiService;

//   @POST("/signup")
//   Future<User> signup(@Body() Map<String, dynamic> body);

//   @POST("/login")
//   Future<User> login(@Body() Map<String, dynamic> body);

//   @POST("/send-otp")
//   Future<Map<String, dynamic>> sendOtp(@Body() Map<String, dynamic> body);

//   @POST("/verify-otp")
//   Future<Map<String, dynamic>> verifyOtp(@Body() Map<String, dynamic> body);

//   @POST("/reset-password")
//   Future<Map<String, dynamic>> resetPassword(@Body() Map<String, dynamic> body);
// }
// import 'package:dealdine_application/features/auth/domain/entities/user.dart';
// import 'package:retrofit/retrofit.dart';
// import 'package:dio/dio.dart';

// part 'auth_api_service.g.dart';

// @RestApi(baseUrl: "http://192.168.100.32:5000/api/auth")
// abstract class AuthApiService {
//   factory AuthApiService(Dio dio, {String baseUrl}) = _AuthApiService;

//   // Signup returns a User object
//   @POST("/signup")
//   Future<User> signup(@Body() Map<String, dynamic> body);

//   // Login returns a User object
//   @POST("/login")
//   Future<User> login(@Body() Map<String, dynamic> body);

//   // These endpoints return plain JSON, so no fromJson required
//   @POST("/send-otp")
//   Future<Map<String, dynamic>> sendOtp(@Body() Map<String, dynamic> body);

//   @POST("/verify-otp")
//   Future<Map<String, dynamic>> verifyOtp(@Body() Map<String, dynamic> body);

//   @POST("/reset-password")
//   Future<Map<String, dynamic>> resetPassword(@Body() Map<String, dynamic> body);
// }
import 'package:dealdine_application/features/auth/domain/entities/user.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'auth_api_service.g.dart';

@RestApi(baseUrl: "http://192.168.100.37:5000/api/auth")
abstract class AuthApiService {
  factory AuthApiService(Dio dio, {String baseUrl}) = _AuthApiService;

  // Signup returns a User object
  @POST("/signup")
  Future<User> signup(@Body() Map<String, dynamic> body);

  // Login returns a User object
  @POST("/login")
  Future<User> login(@Body() Map<String, dynamic> body);

  // These endpoints return raw JSON maps, no fromJson called
  @POST("/send-otp")
  Future<Map<String, dynamic>> sendOtp(@Body() Map<String, dynamic> body);

  @POST("/verify-otp")
  Future<Map<String, dynamic>> verifyOtp(@Body() Map<String, dynamic> body);

  @POST("/reset-password")
  Future<Map<String, dynamic>> resetPassword(@Body() Map<String, dynamic> body);
}
