import 'package:flutter/material.dart';
class OptionTile extends StatelessWidget {
  const OptionTile({super.key, required this.label, required this.value, required this.groupValue, required this.onChanged});
  final String label;
  final int value;
  final int? groupValue;
  final ValueChanged<int?> onChanged;
  @override
  Widget build(BuildContext context) {
    return RadioListTile<int>(title: Text(label), value: value, groupValue: groupValue, onChanged: onChanged);
  }
}
