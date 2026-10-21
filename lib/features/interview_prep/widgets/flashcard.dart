import 'package:flutter/material.dart';
class Flashcard extends StatefulWidget {
  const Flashcard({super.key, required this.question, required this.answer});
  final String question;
  final String answer;
  @override
  State<Flashcard> createState() => _FlashcardState();
}
class _FlashcardState extends State<Flashcard> {
  bool _showAnswer = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => setState(() => _showAnswer = !_showAnswer),
      child: Card(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(24),
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            Text(_showAnswer ? 'Answer' : 'Question', style: const TextStyle(color: Colors.grey)),
            const SizedBox(height: 12),
            Text(_showAnswer ? widget.answer : widget.question, style: const TextStyle(fontSize: 18), textAlign: TextAlign.center),
            const SizedBox(height: 12),
            Text(_showAnswer ? 'Tap to see question' : 'Tap to reveal answer', style: const TextStyle(fontSize: 12, color: Colors.grey)),
          ]),
        ),
      ),
    );
  }
}
