import 'package:flutter/material.dart';
import '../../../app/routes/app_routes.dart';

class CareerPathScreen extends StatelessWidget {
  const CareerPathScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Career Path'),
        actions: [
          IconButton(
            icon: const Icon(Icons.analytics_outlined),
            onPressed: () => Navigator.pushNamed(context, AppRoutes.skillGap),
            tooltip: 'Skill Gap Analysis',
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          Text('Your Roadmap',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          SizedBox(height: 16),
          _MilestoneItem(
              step: 1, title: 'Junior Developer', status: 'Completed'),
          _MilestoneItem(
              step: 2, title: 'Mid-Level Developer', status: 'In Progress'),
          _MilestoneItem(
              step: 3, title: 'Senior Developer', status: 'Upcoming'),
          _MilestoneItem(
              step: 4, title: 'Tech Lead', status: 'Upcoming'),
        ],
      ),
    );
  }
}

class _MilestoneItem extends StatelessWidget {
  const _MilestoneItem({
    required this.step,
    required this.title,
    required this.status,
  });

  final int step;
  final String title;
  final String status;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading: CircleAvatar(child: Text('$step')),
        title: Text(title),
        subtitle: Text(status),
        trailing: status == 'Completed'
            ? const Icon(Icons.check_circle, color: Colors.green)
            : status == 'In Progress'
                ? const Icon(Icons.timelapse, color: Colors.orange)
                : const Icon(Icons.radio_button_unchecked),
      ),
    );
  }
}
