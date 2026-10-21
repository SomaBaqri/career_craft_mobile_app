import 'package:flutter/material.dart';

class ApplyJobBottomSheet extends StatelessWidget {
  final String jobId;

  const ApplyJobBottomSheet({super.key, this.jobId = ''});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(16.0),
      child: Center(child: Text('Apply Job Bottom Sheet')),
    );
  }
}
