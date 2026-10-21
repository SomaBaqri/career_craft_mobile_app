import 'package:flutter/material.dart';

class ApplicantReviewCard extends StatelessWidget {
  final String name;
  final String role;
  final VoidCallback? onTap;

  const ApplicantReviewCard({super.key, required this.name, required this.role, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(name),
        subtitle: Text(role),
        onTap: onTap,
      ),
    );
  }
}
