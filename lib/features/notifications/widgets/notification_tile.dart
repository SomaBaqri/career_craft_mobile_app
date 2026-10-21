import 'package:flutter/material.dart';
class NotificationTile extends StatelessWidget {
  const NotificationTile({super.key, required this.title, required this.body, required this.time});
  final String title, body, time;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const CircleAvatar(child: Icon(Icons.notifications)),
      title: Text(title),
      subtitle: Text(body),
      trailing: Text(time, style: const TextStyle(fontSize: 12, color: Colors.grey)),
    );
  }
}
