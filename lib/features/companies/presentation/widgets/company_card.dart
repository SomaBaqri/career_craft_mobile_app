import 'package:flutter/material.dart';

class CompanyCard extends StatelessWidget {
  final String name;
  final VoidCallback? onTap;

  const CompanyCard({super.key, required this.name, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(name),
        onTap: onTap,
      ),
    );
  }
}
