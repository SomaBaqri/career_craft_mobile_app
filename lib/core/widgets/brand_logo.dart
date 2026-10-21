import 'package:flutter/material.dart';

class BrandLogo extends StatelessWidget {
  final double size;

  const BrandLogo({super.key, this.size = 40.0});

  @override
  Widget build(BuildContext context) {
    return Icon(Icons.work, size: size, color: Theme.of(context).primaryColor);
  }
}
