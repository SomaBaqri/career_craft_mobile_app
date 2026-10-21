import 'package:flutter/material.dart';
class PageIndicator extends StatelessWidget {
  const PageIndicator({super.key, required this.count, required this.current});
  final int count;
  final int current;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(count, (i) => AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        margin: const EdgeInsets.symmetric(horizontal: 4),
        width: i == current ? 20 : 8, height: 8,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: i == current ? Theme.of(context).colorScheme.primary : Colors.grey,
        ),
      )),
    );
  }
}
