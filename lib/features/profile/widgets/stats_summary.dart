import 'package:flutter/material.dart';
class StatsSummary extends StatelessWidget {
  const StatsSummary({super.key, required this.resumeCount, required this.appliedCount, required this.savedCount});
  final int resumeCount, appliedCount, savedCount;
  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
      _Stat(label: 'Resumes', value: ''),
      _Stat(label: 'Applied', value: ''),
      _Stat(label: 'Saved', value: ''),
    ]);
  }
}
class _Stat extends StatelessWidget {
  const _Stat({required this.label, required this.value});
  final String label, value;
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Text(value, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
      Text(label, style: const TextStyle(color: Colors.grey)),
    ]);
  }
}
