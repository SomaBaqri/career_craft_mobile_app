import 'package:flutter/material.dart';
class CompanyLogo extends StatelessWidget {
  const CompanyLogo({super.key, this.imageUrl, required this.companyName});
  final String? imageUrl;
  final String companyName;
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundImage: imageUrl != null ? NetworkImage(imageUrl!) : null,
      child: imageUrl == null ? Text(companyName[0].toUpperCase()) : null,
    );
  }
}
