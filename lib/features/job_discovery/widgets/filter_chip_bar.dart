import 'package:flutter/material.dart';
class FilterChipBar extends StatelessWidget {
  const FilterChipBar({super.key, required this.filters, required this.selected, required this.onSelected});
  final List<String> filters;
  final String selected;
  final ValueChanged<String> onSelected;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Row(
        children: filters.map((f) => Padding(
          padding: const EdgeInsets.only(right: 8),
          child: ChoiceChip(label: Text(f), selected: selected == f, onSelected: (_) => onSelected(f)),
        )).toList(),
      ),
    );
  }
}
