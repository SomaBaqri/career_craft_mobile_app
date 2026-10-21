import 'package:flutter/material.dart';
class AvatarWidget extends StatelessWidget {
  const AvatarWidget({super.key, this.imageUrl, required this.name, this.radius = 40});
  final String? imageUrl;
  final String name;
  final double radius;
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      backgroundImage: imageUrl != null ? NetworkImage(imageUrl!) : null,
      child: imageUrl == null ? Text(name[0].toUpperCase(), style: TextStyle(fontSize: radius * 0.6)) : null,
    );
  }
}
