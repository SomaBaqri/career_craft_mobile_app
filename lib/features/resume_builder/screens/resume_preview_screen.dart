import 'package:flutter/material.dart';

class ResumePreviewScreen extends StatelessWidget {
  const ResumePreviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Preview Resume'),
        actions: [
          IconButton(
            icon: const Icon(Icons.download_outlined),
            onPressed: () {
              // TODO: Implement PDF export
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Export coming soon!')),
              );
            },
          ),
        ],
      ),
      body: const Center(
        child: Text('Resume preview will appear here.'),
      ),
    );
  }
}
