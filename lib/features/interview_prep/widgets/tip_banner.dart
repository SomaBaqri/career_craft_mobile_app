import 'package:flutter/material.dart';
class TipBanner extends StatelessWidget {
  const TipBanner({super.key, required this.tip});
  final String tip;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).colorScheme.primaryContainer,
      child: Padding(padding: const EdgeInsets.all(12), child: Row(children: [
        const Icon(Icons.lightbulb_outline),
        const SizedBox(width: 8),
        Expanded(child: Text(tip)),
      ])),
    );
  }
}
