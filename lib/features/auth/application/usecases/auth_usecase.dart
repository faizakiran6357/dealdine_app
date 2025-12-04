import '../../domain/entities/user.dart';
import '../../domain/repositories/auth_repository.dart';

class AuthUseCase {
  final AuthRepository repository;

  AuthUseCase(this.repository);

  Future<User> signup(String name, String email, String password) async {
    return await repository.signup(name, email, password);
  }

  Future<User> login(String email, String password) async {
    return await repository.login(email, password);
  }

  Future<void> sendOtp(String email) async {
    await repository.sendOtp(email);
  }

  Future<void> verifyOtp(String email, String otp) async {
    await repository.verifyOtp(email, otp);
  }

  Future<void> resetPassword(String email, String newPassword) async {
    await repository.resetPassword(email, newPassword);
  }
}
