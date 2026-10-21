import 'package:flutter/material.dart';
import '../../../app/routes/app_routes.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Results')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.emoji_events_outlined, size: 80),
              const SizedBox(height: 16),
              const Text('Quiz Complete!',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              const Text('Your score: 8 / 10',
                  style: TextStyle(fontSize: 18)),
              const SizedBox(height: 8),
              const Text('80% — Great job!'),
              const SizedBox(height: 32),
              ElevatedButton(
                onPressed: () =>
                    Navigator.pushReplacementNamed(context, AppRoutes.assessmentList),
                child: const Text('Back to Assessments'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
