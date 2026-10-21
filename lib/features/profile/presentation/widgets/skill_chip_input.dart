import 'package:flutter/material.dart';

class SkillChipInput extends StatelessWidget {
  final List<String> skills;
  final ValueChanged<String>? onDeleted;

  const SkillChipInput({super.key, this.skills = const [], this.onDeleted});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: skills
          .map((s) => Chip(
                label: Text(s),
                onDeleted: onDeleted != null ? () => onDeleted!(s) : null,
              ))
          .toList(),
    );
  }
}
