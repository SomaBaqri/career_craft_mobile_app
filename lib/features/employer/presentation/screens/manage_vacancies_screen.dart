import 'package:flutter/material.dart';

class ManageVacanciesScreen extends StatelessWidget {
  const ManageVacanciesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Manage Vacancies')),
      body: const Center(child: Text('Manage Vacancies Screen')),
    );
  }
}
