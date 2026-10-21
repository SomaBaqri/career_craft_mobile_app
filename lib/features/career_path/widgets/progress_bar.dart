import 'package:flutter/material.dart';
class CareerProgressBar extends StatelessWidget {
  const CareerProgressBar({super.key, required this.label, required this.value});
  final String label;
  final double value;
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Text(label), Text('%')]),
      const SizedBox(height: 4),
      LinearProgressIndicator(value: value),
    ]);
  }
}
