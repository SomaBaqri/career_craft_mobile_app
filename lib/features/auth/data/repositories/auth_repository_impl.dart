import '../datasources/auth_remote_datasource.dart';
import '../models/auth_response_model.dart';

class AuthRepositoryImpl {
  final AuthRemoteDataSource remoteDataSource;

  AuthRepositoryImpl({AuthRemoteDataSource? remoteDataSource})
      : remoteDataSource = remoteDataSource ?? AuthRemoteDataSource();

  Future<AuthResponseModel> login(String email, String password) {
    return remoteDataSource.login(email, password);
  }

  Future<AuthResponseModel> register(String name, String email, String password, String role) {
    return remoteDataSource.register(name, email, password, role);
  }

  Future<bool> verifyOtp(String email, String otp) {
    return remoteDataSource.verifyOtp(email, otp);
  }
}
