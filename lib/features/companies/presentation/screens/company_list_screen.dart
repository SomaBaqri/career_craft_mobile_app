import 'package:flutter/material.dart';

class CompanyListScreen extends StatelessWidget {
  const CompanyListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Companies')),
      body: const Center(child: Text('Company List Screen')),
    );
  }
}
