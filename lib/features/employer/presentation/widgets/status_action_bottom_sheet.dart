import 'package:flutter/material.dart';

class StatusActionBottomSheet extends StatelessWidget {
  final ValueChanged<String>? onStatusSelected;

  const StatusActionBottomSheet({super.key, this.onStatusSelected});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(16.0),
      child: Center(child: Text('Status Action Sheet')),
    );
  }
}
