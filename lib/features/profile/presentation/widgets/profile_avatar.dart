import 'package:flutter/material.dart';

class ProfileAvatar extends StatelessWidget {
  final String? imageUrl;
  final double radius;

  const ProfileAvatar({super.key, this.imageUrl, this.radius = 30.0});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      child: const Icon(Icons.person),
    );
  }
}
