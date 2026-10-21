import 'package:flutter/material.dart';
import '../../../app/routes/app_routes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CareerCraft'),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_outlined),
            onPressed: () => Navigator.pushNamed(context, AppRoutes.notifications),
          ),
          IconButton(
            icon: const Icon(Icons.person_outline),
            onPressed: () => Navigator.pushNamed(context, AppRoutes.profile),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Hello, User 👋',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            const SizedBox(height: 4),
            const Text('What would you like to do today?'),
            const SizedBox(height: 24),
            const Text('Quick Actions',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
            const SizedBox(height: 12),
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
              children: [
                _ActionCard(
                  icon: Icons.description_outlined,
                  label: 'Resume Builder',
                  onTap: () => Navigator.pushNamed(context, AppRoutes.resumeList),
                ),
                _ActionCard(
                  icon: Icons.search,
                  label: 'Job Discovery',
                  onTap: () => Navigator.pushNamed(context, AppRoutes.jobList),
                ),
                _ActionCard(
                  icon: Icons.map_outlined,
                  label: 'Career Path',
                  onTap: () => Navigator.pushNamed(context, AppRoutes.careerPath),
                ),
                _ActionCard(
                  icon: Icons.quiz_outlined,
                  label: 'Skill Assessment',
                  onTap: () => Navigator.pushNamed(context, AppRoutes.assessmentList),
                ),
                _ActionCard(
                  icon: Icons.mic_outlined,
                  label: 'Interview Prep',
                  onTap: () => Navigator.pushNamed(context, AppRoutes.interviewPrep),
                ),
                _ActionCard(
                  icon: Icons.settings_outlined,
                  label: 'Settings',
                  onTap: () => Navigator.pushNamed(context, AppRoutes.settings),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _ActionCard extends StatelessWidget {
  const _ActionCard({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  final IconData icon;
  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 40),
            const SizedBox(height: 8),
            Text(label, textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }
}
