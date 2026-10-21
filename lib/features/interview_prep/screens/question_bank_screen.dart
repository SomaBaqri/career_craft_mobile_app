import 'package:flutter/material.dart';

class QuestionBankScreen extends StatelessWidget {
  const QuestionBankScreen({super.key});

  static const List<Map<String, String>> _questions = [
    {'q': 'Tell me about yourself.', 'cat': 'General'},
    {'q': 'What is your greatest strength?', 'cat': 'Behavioral'},
    {'q': 'Describe a challenging project you worked on.', 'cat': 'Behavioral'},
    {'q': 'Explain the difference between OOP and functional programming.', 'cat': 'Technical'},
    {'q': 'How do you handle tight deadlines?', 'cat': 'Behavioral'},
    {'q': 'What is a REST API?', 'cat': 'Technical'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Question Bank')),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: _questions.length,
        separatorBuilder: (_, __) => const SizedBox(height: 8),
        itemBuilder: (context, index) {
          final item = _questions[index];
          return Card(
            child: ExpansionTile(
              leading: const Icon(Icons.help_outline),
              title: Text(item['q']!),
              subtitle: Text(item['cat']!),
              children: const [
                Padding(
                  padding: EdgeInsets.all(16),
                  child: Text('Sample answer will appear here.'),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
