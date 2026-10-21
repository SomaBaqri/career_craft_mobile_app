import '../../core/network/api_service.dart';
import '../../core/network/token_storage.dart';
import '../../core/constants/api_endpoints.dart';

/// Handles all Laravel Sanctum authentication operations.
class AuthService {
  AuthService._();
  static final AuthService instance = AuthService._();

  final _api = ApiService.instance;

  // ─── Login ────────────────────────────────────────────────────────────────

  /// Calls POST /api/login.
  /// Returns [AuthResult] with token + user role on success, error message on failure.
  Future<AuthResult> login({
    required String email,
    required String password,
  }) async {
    final response = await _api.post(
      ApiEndpoints.login,
      {'email': email, 'password': password},
      auth: false,
    );

    if (response.isSuccess && response.data != null) {
      return _handleAuthSuccess(response.data!);
    }
    return AuthResult.failure(response.error ?? 'Login failed');
  }

  // ─── Register ─────────────────────────────────────────────────────────────

  /// Calls POST /api/register.
  Future<AuthResult> register({
    required String name,
    required String email,
    required String password,
    String role = 'job_seeker', // 'job_seeker' | 'employer'
  }) async {
    final response = await _api.post(
      ApiEndpoints.register,
      {
        'name': name,
        'email': email,
        'password': password,
        'password_confirmation': password,
        'role': role,
      },
      auth: false,
    );

    if (response.isSuccess && response.data != null) {
      return _handleAuthSuccess(response.data!);
    }
    return AuthResult.failure(response.error ?? 'Registration failed');
  }

  // ─── Logout ───────────────────────────────────────────────────────────────

  /// Calls POST /api/logout then clears local storage.
  Future<void> logout() async {
    await _api.post(ApiEndpoints.logout, {});
    await TokenStorage.clearAll();
  }

  // ─── Forgot Password ──────────────────────────────────────────────────────

  Future<String?> forgotPassword(String email) async {
    final response = await _api.post(
      ApiEndpoints.forgotPassword,
      {'email': email},
      auth: false,
    );
    if (response.isSuccess) return null; // null = no error
    return response.error ?? 'Failed to send reset email';
  }

  // ─── Internal ─────────────────────────────────────────────────────────────

  Future<AuthResult> _handleAuthSuccess(Map<String, dynamic> data) async {
    // Laravel typically returns: { token: '...', user: { id, name, email, role } }
    final token = data['token'] as String?;
    final user = data['user'] as Map<String, dynamic>?;

    if (token == null || user == null) {
      return AuthResult.failure('Invalid server response');
    }

    await TokenStorage.saveToken(token);
    await TokenStorage.saveUserInfo(
      id: (user['id'] as num).toInt(),
      name: user['name'] as String? ?? '',
      email: user['email'] as String? ?? '',
      role: user['role'] as String? ?? 'job_seeker',
    );

    return AuthResult.success(
      token: token,
      role: user['role'] as String? ?? 'job_seeker',
    );
  }
}

/// Result object returned by auth operations.
class AuthResult {
  final bool success;
  final String? token;
  final String? role;
  final String? errorMessage;

  const AuthResult._({
    required this.success,
    this.token,
    this.role,
    this.errorMessage,
  });

  factory AuthResult.success({required String token, required String role}) =>
      AuthResult._(success: true, token: token, role: role);

  factory AuthResult.failure(String message) =>
      AuthResult._(success: false, errorMessage: message);
}
