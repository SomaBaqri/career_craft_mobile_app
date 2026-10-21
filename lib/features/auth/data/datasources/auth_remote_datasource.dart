import '../models/auth_response_model.dart';

class AuthRemoteDataSource {
  Future<AuthResponseModel> login(String email, String password) async {
    return const AuthResponseModel(token: 'dummy_token');
  }

  Future<AuthResponseModel> register(String name, String email, String password, String role) async {
    return const AuthResponseModel(token: 'dummy_token');
  }

  Future<bool> verifyOtp(String email, String otp) async {
    return true;
  }
}
