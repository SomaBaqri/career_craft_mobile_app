import 'package:flutter/material.dart';

class JobFeedScreen extends StatelessWidget {
  const JobFeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Jobs')),
      body: const Center(child: Text('Job Feed Screen')),
    );
  }
}
