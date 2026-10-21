import 'package:flutter/material.dart';

class EmptyStateView extends StatelessWidget {
  final String message;

  const EmptyStateView({super.key, this.message = 'No data available'});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(message),
    );
  }
}
