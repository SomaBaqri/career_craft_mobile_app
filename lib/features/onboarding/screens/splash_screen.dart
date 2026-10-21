import 'package:flutter/material.dart';
import '../../../app/routes/app_routes.dart';
import '../../../core/constants/app_constants.dart';
import '../../../core/network/token_storage.dart';

/// Splash screen — checks for a saved Sanctum token.
/// If token exists → go straight to Home.
/// Otherwise → go to Onboarding.
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigate();
  }

  Future<void> _navigate() async {
    // Wait for splash duration and session check in parallel
    final results = await Future.wait([
      Future.delayed(AppConstants.splashDuration),
      TokenStorage.isLoggedIn(),
    ]);

    if (!mounted) return;

    final isLoggedIn = results[1] as bool;
    Navigator.pushReplacementNamed(
      context,
      isLoggedIn ? AppRoutes.home : AppRoutes.onboarding,
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.work_outline, size: 80),
            SizedBox(height: 16),
            Text(
              'CareerCraft',
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text('Your career, crafted.'),
            SizedBox(height: 32),
            CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
