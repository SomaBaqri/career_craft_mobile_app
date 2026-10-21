import 'package:flutter/material.dart';
import '../../../app/routes/app_routes.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int _currentQuestion = 0;
  int? _selectedOption;

  final List<Map<String, dynamic>> _questions = [
    {
      'question': 'What is Flutter?',
      'options': [
        'A UI toolkit',
        'A database',
        'A server framework',
        'A language',
      ],
      'answer': 0,
    },
    {
      'question': 'Which language does Flutter use?',
      'options': ['Java', 'Kotlin', 'Dart', 'Swift'],
      'answer': 2,
    },
  ];

  void _onNext() {
    if (_currentQuestion < _questions.length - 1) {
      setState(() {
        _currentQuestion++;
        _selectedOption = null;
      });
    } else {
      Navigator.pushReplacementNamed(context, AppRoutes.result);
    }
  }

  @override
  Widget build(BuildContext context) {
    final q = _questions[_currentQuestion];
    return Scaffold(
      appBar: AppBar(
        title: Text('Question ${_currentQuestion + 1}/${_questions.length}'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            LinearProgressIndicator(
              value: (_currentQuestion + 1) / _questions.length,
            ),
            const SizedBox(height: 24),
            Text(q['question'],
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
            const SizedBox(height: 24),
            ...List.generate(
              (q['options'] as List).length,
              (i) => RadioListTile<int>(
                title: Text(q['options'][i]),
                value: i,
                groupValue: _selectedOption,
                onChanged: (v) => setState(() => _selectedOption = v),
              ),
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _selectedOption != null ? _onNext : null,
                child: Text(
                  _currentQuestion == _questions.length - 1 ? 'Finish' : 'Next',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
