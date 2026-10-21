import 'package:flutter/material.dart';
class ThemeToggle extends StatelessWidget {
  const ThemeToggle({super.key, required this.isDark, required this.onChanged});
  final bool isDark;
  final ValueChanged<bool> onChanged;
  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      title: const Text('Dark Mode'),
      secondary: Icon(isDark ? Icons.dark_mode : Icons.light_mode),
      value: isDark,
      onChanged: onChanged,
    );
  }
}
