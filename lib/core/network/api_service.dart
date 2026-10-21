import 'dart:convert';
import 'package:http/http.dart' as http;
import '../constants/app_constants.dart';
import 'token_storage.dart';

/// HTTP response wrapper
class ApiResponse<T> {
  final T? data;
  final String? error;
  final int statusCode;

  const ApiResponse({this.data, this.error, required this.statusCode});

  bool get isSuccess => statusCode >= 200 && statusCode < 300;
}

/// Centralized API service — all Laravel backend calls go through here.
class ApiService {
  ApiService._();
  static final ApiService instance = ApiService._();

  final _client = http.Client();

  // ─── Header Builder ───────────────────────────────────────────────────────

  Future<Map<String, String>> _headers({bool auth = true}) async {
    final headers = <String, String>{
      'Accept': 'application/json',
      'Content-Type': 'application/json',
    };
    if (auth) {
      final token = await TokenStorage.getToken();
      if (token != null) {
        headers['Authorization'] = 'Bearer $token';
      }
    }
    return headers;
  }

  // ─── Generic Request Helpers ──────────────────────────────────────────────

  Future<ApiResponse<Map<String, dynamic>>> get(
    String endpoint, {
    Map<String, String>? queryParams,
    bool auth = true,
  }) async {
    try {
      final uri = Uri.parse('${AppConstants.baseUrl}$endpoint')
          .replace(queryParameters: queryParams);
      final response = await _client.get(uri, headers: await _headers(auth: auth));
      return _parseResponse(response);
    } catch (e) {
      return ApiResponse(error: 'Network error: $e', statusCode: 0);
    }
  }

  Future<ApiResponse<Map<String, dynamic>>> post(
    String endpoint,
    Map<String, dynamic> body, {
    bool auth = true,
  }) async {
    try {
      final uri = Uri.parse('${AppConstants.baseUrl}$endpoint');
      final response = await _client.post(
        uri,
        headers: await _headers(auth: auth),
        body: jsonEncode(body),
      );
      return _parseResponse(response);
    } catch (e) {
      return ApiResponse(error: 'Network error: $e', statusCode: 0);
    }
  }

  Future<ApiResponse<Map<String, dynamic>>> put(
    String endpoint,
    Map<String, dynamic> body, {
    bool auth = true,
  }) async {
    try {
      final uri = Uri.parse('${AppConstants.baseUrl}$endpoint');
      final response = await _client.put(
        uri,
        headers: await _headers(auth: auth),
        body: jsonEncode(body),
      );
      return _parseResponse(response);
    } catch (e) {
      return ApiResponse(error: 'Network error: $e', statusCode: 0);
    }
  }

  Future<ApiResponse<Map<String, dynamic>>> delete(
    String endpoint, {
    bool auth = true,
  }) async {
    try {
      final uri = Uri.parse('${AppConstants.baseUrl}$endpoint');
      final response = await _client.delete(uri, headers: await _headers(auth: auth));
      return _parseResponse(response);
    } catch (e) {
      return ApiResponse(error: 'Network error: $e', statusCode: 0);
    }
  }

  // ─── Response Parser ──────────────────────────────────────────────────────

  ApiResponse<Map<String, dynamic>> _parseResponse(http.Response response) {
    try {
      final body = jsonDecode(response.body) as Map<String, dynamic>;
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return ApiResponse(data: body, statusCode: response.statusCode);
      } else {
        final message = body['message'] as String? ??
            body['error'] as String? ??
            'Request failed (${response.statusCode})';
        return ApiResponse(error: message, statusCode: response.statusCode);
      }
    } catch (_) {
      return ApiResponse(
        error: 'Invalid response from server',
        statusCode: response.statusCode,
      );
    }
  }
}
