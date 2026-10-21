import 'package:flutter/material.dart';

class SkillGapScreen extends StatelessWidget {
  const SkillGapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Skill Gap Analysis')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          Text('Skills You Have',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
          SizedBox(height: 8),
          _SkillRow(skill: 'Flutter', level: 0.8),
          _SkillRow(skill: 'Dart', level: 0.75),
          SizedBox(height: 24),
          Text('Skills to Acquire',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
          SizedBox(height: 8),
          _SkillRow(skill: 'Laravel / PHP', level: 0.2),
          _SkillRow(skill: 'System Design', level: 0.3),
          _SkillRow(skill: 'CI/CD', level: 0.1),
        ],
      ),
    );
  }
}

class _SkillRow extends StatelessWidget {
  const _SkillRow({required this.skill, required this.level});

  final String skill;
  final double level;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(skill),
              Text('${(level * 100).round()}%'),
            ],
          ),
          const SizedBox(height: 4),
          LinearProgressIndicator(value: level),
        ],
      ),
    );
  }
}
