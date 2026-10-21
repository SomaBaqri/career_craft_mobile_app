import 'package:flutter/material.dart';
import 'app/routes/route_generator.dart';
import 'app/theme/app_theme.dart';
import 'features/onboarding/screens/splash_screen.dart';

void main() {
  runApp(const CareerCraftApp());
}

class CareerCraftApp extends StatelessWidget {
  const CareerCraftApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CareerCraft',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      home: const SplashScreen(),
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
