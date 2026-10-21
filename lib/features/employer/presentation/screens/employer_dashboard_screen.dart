import 'package:flutter/material.dart';

class EmployerDashboardScreen extends StatelessWidget {
  const EmployerDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Employer Dashboard')),
      body: const Center(child: Text('Employer Dashboard Screen')),
    );
  }
}
