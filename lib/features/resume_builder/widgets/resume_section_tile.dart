import 'package:flutter/material.dart';
class ResumeSectionTile extends StatelessWidget {
  const ResumeSectionTile({super.key, required this.title, this.subtitle, required this.onTap});
  final String title;
  final String? subtitle;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      subtitle: subtitle != null ? Text(subtitle!) : null,
      trailing: const Icon(Icons.edit_outlined),
      onTap: onTap,
    );
  }
}
