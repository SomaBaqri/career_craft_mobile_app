import 'package:flutter/material.dart';
class TemplateCard extends StatelessWidget {
  const TemplateCard({super.key, required this.name, required this.onTap, this.isSelected = false});
  final String name;
  final VoidCallback onTap;
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: BorderSide(color: isSelected ? Theme.of(context).colorScheme.primary : Colors.transparent, width: 2),
        ),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          const Icon(Icons.description_outlined, size: 48),
          const SizedBox(height: 8),
          Text(name),
        ]),
      ),
    );
  }
}
