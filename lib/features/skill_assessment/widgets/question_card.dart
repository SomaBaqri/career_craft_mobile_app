import 'package:flutter/material.dart';
class QuestionCard extends StatelessWidget {
  const QuestionCard({super.key, required this.question, required this.questionNumber, required this.total});
  final String question;
  final int questionNumber;
  final int total;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(padding: const EdgeInsets.all(16), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text('Question  of ', style: const TextStyle(color: Colors.grey)),
        const SizedBox(height: 8),
        Text(question, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
      ])),
    );
  }
}
