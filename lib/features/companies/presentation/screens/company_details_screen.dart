import 'package:flutter/material.dart';

class CompanyDetailsScreen extends StatelessWidget {
  final String companyId;

  const CompanyDetailsScreen({super.key, this.companyId = ''});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Company Details')),
      body: Center(child: Text('Company Details: $companyId')),
    );
  }
}
