import 'package:flutter/material.dart';
class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key, required this.userName});
  final String userName;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Hello,  👋', style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
        const Text('What would you like to do today?'),
      ],
    );
  }
}
