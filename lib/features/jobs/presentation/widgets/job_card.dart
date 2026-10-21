import 'package:flutter/material.dart';

class JobCard extends StatelessWidget {
  final String title;
  final String company;
  final VoidCallback? onTap;

  const JobCard({super.key, required this.title, required this.company, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(title),
        subtitle: Text(company),
        onTap: onTap,
      ),
    );
  }
}
