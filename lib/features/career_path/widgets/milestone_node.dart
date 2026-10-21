import 'package:flutter/material.dart';
class MilestoneNode extends StatelessWidget {
  const MilestoneNode({super.key, required this.step, required this.title, required this.isCompleted});
  final int step;
  final String title;
  final bool isCompleted;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: isCompleted ? Colors.green : Colors.grey,
        child: isCompleted ? const Icon(Icons.check, color: Colors.white) : Text(''),
      ),
      title: Text(title),
    );
  }
}
