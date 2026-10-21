import 'package:flutter/material.dart';

class ApplicationStatusTag extends StatelessWidget {
  final String status;

  const ApplicationStatusTag({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    return Chip(label: Text(status));
  }
}
