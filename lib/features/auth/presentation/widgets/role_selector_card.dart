import 'package:flutter/material.dart';

class RoleSelectorCard extends StatelessWidget {
  final String role;
  final VoidCallback? onTap;

  const RoleSelectorCard({super.key, required this.role, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(role),
        onTap: onTap,
      ),
    );
  }
}
