import 'package:dealdine_application/features/auth/domain/entities/user.dart';

abstract class AuthRepository {
  Future<User> signup(String name, String email, String password);
  Future<User> login(String email, String password);
  Future<void> sendOtp(String email);
  Future<void> verifyOtp(String email, String otp);
  Future<void> resetPassword(String email, String newPassword);
}
