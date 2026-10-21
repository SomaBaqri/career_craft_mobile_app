import 'package:flutter/material.dart';
import '../../../app/routes/app_routes.dart';

class InterviewPrepScreen extends StatelessWidget {
  const InterviewPrepScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Interview Prep')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Card(
              child: ListTile(
                leading: const Icon(Icons.menu_book_outlined),
                title: const Text('Question Bank'),
                subtitle: const Text('Browse 200+ interview questions'),
                trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                onTap: () => Navigator.pushNamed(context, AppRoutes.questionBank),
              ),
            ),
            const SizedBox(height: 8),
            Card(
              child: ListTile(
                leading: const Icon(Icons.mic_outlined),
                title: const Text('Mock Interview'),
                subtitle: const Text('Practice with timed sessions'),
                trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                onTap: () => Navigator.pushNamed(context, AppRoutes.mockInterview),
              ),
            ),
            const SizedBox(height: 24),
            const Text('Quick Tips',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
            const SizedBox(height: 8),
            const _TipCard('Research the company before your interview.'),
            const _TipCard('Practice the STAR method for behavioral questions.'),
            const _TipCard('Prepare 3–5 questions to ask the interviewer.'),
          ],
        ),
      ),
    );
  }
}

class _TipCard extends StatelessWidget {
  const _TipCard(this.tip);
  final String tip;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            const Icon(Icons.lightbulb_outline, size: 20),
            const SizedBox(width: 8),
            Expanded(child: Text(tip)),
          ],
        ),
      ),
    );
  }
}
