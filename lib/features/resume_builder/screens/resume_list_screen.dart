import 'package:flutter/material.dart';
import '../../../app/routes/app_routes.dart';

class ResumeListScreen extends StatelessWidget {
  const ResumeListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My Resumes')),
      body: const Center(child: Text('No resumes yet.')),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => Navigator.pushNamed(context, AppRoutes.templatePicker),
        icon: const Icon(Icons.add),
        label: const Text('New Resume'),
      ),
    );
  }
}
