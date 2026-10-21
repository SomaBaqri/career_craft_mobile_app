import 'package:flutter/material.dart';

class ApplicationCard extends StatelessWidget {
  final String title;
  final String status;

  const ApplicationCard({super.key, required this.title, required this.status});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(title),
        trailing: Text(status),
      ),
    );
  }
}
