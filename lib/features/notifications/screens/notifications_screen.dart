import 'package:flutter/material.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  static const List<Map<String, String>> _notifications = [
    {'title': 'New Job Match!', 'body': 'Flutter Developer at TechCorp', 'time': '2 min ago'},
    {'title': 'Assessment Complete', 'body': 'You scored 80% on Flutter Basics', 'time': '1 hr ago'},
    {'title': 'Profile View', 'body': 'A recruiter viewed your profile', 'time': '3 hr ago'},
    {'title': 'Resume Tip', 'body': 'Add a summary to increase visibility', 'time': 'Yesterday'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Notifications')),
      body: _notifications.isEmpty
          ? const Center(child: Text('No notifications yet.'))
          : ListView.separated(
              itemCount: _notifications.length,
              separatorBuilder: (_, __) => const Divider(height: 1),
              itemBuilder: (context, index) {
                final n = _notifications[index];
                return ListTile(
                  leading: const CircleAvatar(child: Icon(Icons.notifications)),
                  title: Text(n['title']!),
                  subtitle: Text(n['body']!),
                  trailing: Text(n['time']!,
                      style: const TextStyle(fontSize: 12, color: Colors.grey)),
                );
              },
            ),
    );
  }
}
