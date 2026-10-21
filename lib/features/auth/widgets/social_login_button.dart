import 'package:flutter/material.dart';
class SocialLoginButton extends StatelessWidget {
  const SocialLoginButton({super.key, required this.label, required this.onPressed, this.icon});
  final String label;
  final VoidCallback onPressed;
  final Widget? icon;
  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      onPressed: onPressed,
      icon: icon ?? const Icon(Icons.login),
      label: Text(label),
    );
  }
}
