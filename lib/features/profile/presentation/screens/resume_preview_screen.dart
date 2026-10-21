import 'package:flutter/material.dart';

class ResumePreviewScreen extends StatelessWidget {
  const ResumePreviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Resume Preview')),
      body: const Center(child: Text('Resume Preview Screen')),
    );
  }
}
