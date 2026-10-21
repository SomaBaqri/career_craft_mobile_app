import 'package:flutter/foundation.dart';

class AppConstants {
  AppConstants._();

  /// Laravel backend base URL.
  /// - Web / Desktop / iOS Simulator: http://127.0.0.1:8000
  /// - Android Emulator: http://10.0.2.2:8000
  static String get baseUrl {
    if (kIsWeb) {
      return 'http://127.0.0.1:8000';
    }
    if (defaultTargetPlatform == TargetPlatform.android) {
      return 'http://10.0.2.2:8000';
    }
    return 'http://127.0.0.1:8000';
  }

  static const int defaultPageSize = 20;
  static const int maxResumeCount = 5;
  static const Duration requestTimeout = Duration(seconds: 30);
  static const Duration splashDuration = Duration(seconds: 2);
}
