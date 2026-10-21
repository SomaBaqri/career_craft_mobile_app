import 'package:flutter/material.dart';
import '../../../app/routes/app_routes.dart';

class AssessmentListScreen extends StatelessWidget {
  const AssessmentListScreen({super.key});

  static const List<Map<String, dynamic>> _assessments = [
    {'title': 'Flutter Basics', 'questions': 10, 'duration': '15 min'},
    {'title': 'Dart Fundamentals', 'questions': 15, 'duration': '20 min'},
    {'title': 'Problem Solving', 'questions': 8, 'duration': '25 min'},
    {'title': 'Software Design', 'questions': 12, 'duration': '30 min'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Skill Assessments')),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: _assessments.length,
        separatorBuilder: (_, __) => const SizedBox(height: 8),
        itemBuilder: (context, index) {
          final item = _assessments[index];
          return Card(
            child: ListTile(
              leading: const Icon(Icons.quiz_outlined),
              title: Text(item['title']),
              subtitle: Text('${item['questions']} questions • ${item['duration']}'),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () => Navigator.pushNamed(context, AppRoutes.quiz),
            ),
          );
        },
      ),
    );
  }
}
