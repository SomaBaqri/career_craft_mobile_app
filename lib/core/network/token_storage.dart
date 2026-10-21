import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Securely stores and retrieves the Sanctum Bearer token and user metadata.
class TokenStorage {
  TokenStorage._();

  static const _storage = FlutterSecureStorage(
    aOptions: AndroidOptions(encryptedSharedPreferences: true),
  );

  static const _keyToken = 'auth_token';
  static const _keyRole = 'user_role';
  static const _keyUserId = 'user_id';
  static const _keyUserName = 'user_name';
  static const _keyUserEmail = 'user_email';

  // ─── Token ──────────────────────────────────────────────────────────────

  static Future<void> saveToken(String token) =>
      _storage.write(key: _keyToken, value: token);

  static Future<String?> getToken() => _storage.read(key: _keyToken);

  static Future<void> deleteToken() => _storage.delete(key: _keyToken);

  // ─── User Role ───────────────────────────────────────────────────────────

  static Future<void> saveRole(String role) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_keyRole, role);
  }

  static Future<String?> getRole() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_keyRole);
  }

  // ─── User Info ───────────────────────────────────────────────────────────

  static Future<void> saveUserInfo({
    required int id,
    required String name,
    required String email,
    required String role,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    await Future.wait([
      prefs.setInt(_keyUserId, id),
      prefs.setString(_keyUserName, name),
      prefs.setString(_keyUserEmail, email),
      prefs.setString(_keyRole, role),
    ]);
  }

  static Future<Map<String, dynamic>> getUserInfo() async {
    final prefs = await SharedPreferences.getInstance();
    return {
      'id': prefs.getInt(_keyUserId),
      'name': prefs.getString(_keyUserName),
      'email': prefs.getString(_keyUserEmail),
      'role': prefs.getString(_keyRole),
    };
  }

  // ─── Clear All (Logout) ──────────────────────────────────────────────────

  static Future<void> clearAll() async {
    await _storage.deleteAll();
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }

  // ─── Session Check ───────────────────────────────────────────────────────

  static Future<bool> isLoggedIn() async {
    final token = await getToken();
    return token != null && token.isNotEmpty;
  }
}
