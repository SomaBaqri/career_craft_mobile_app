import 'package:flutter/material.dart';
class ScoreIndicator extends StatelessWidget {
  const ScoreIndicator({super.key, required this.score, required this.total});
  final int score;
  final int total;
  @override
  Widget build(BuildContext context) {
    final percentage = score / total;
    return Column(children: [
      Text(' / ', style: const TextStyle(fontSize: 36, fontWeight: FontWeight.bold)),
      const SizedBox(height: 8),
      LinearProgressIndicator(value: percentage, minHeight: 8),
      const SizedBox(height: 4),
      Text('%'),
    ]);
  }
}
