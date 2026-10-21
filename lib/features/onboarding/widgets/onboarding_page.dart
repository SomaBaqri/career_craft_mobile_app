import 'package:flutter/material.dart';
class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key, required this.title, required this.description, this.icon = Icons.star_outline});
  final String title;
  final String description;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, size: 100),
        const SizedBox(height: 24),
        Text(title, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        const SizedBox(height: 12),
        Padding(padding: const EdgeInsets.symmetric(horizontal: 32), child: Text(description, textAlign: TextAlign.center)),
      ],
    );
  }
}
