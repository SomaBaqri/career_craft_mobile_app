import 'package:flutter/material.dart';
class JobCard extends StatelessWidget {
  const JobCard({super.key, required this.title, required this.company, required this.location, required this.salary, required this.onTap});
  final String title, company, location, salary;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: const CircleAvatar(child: Icon(Icons.business)),
        title: Text(title),
        subtitle: Text(' • '),
        trailing: Text(salary),
        onTap: onTap,
      ),
    );
  }
}
