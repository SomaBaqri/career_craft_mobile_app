import 'package:flutter/material.dart';
import '../../../app/routes/app_routes.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit_outlined),
            onPressed: () => Navigator.pushNamed(context, AppRoutes.editProfile),
          ),
        ],
      ),
      body: ListView(
        children: [
          const SizedBox(height: 24),
          const Center(
            child: Column(
              children: [
                CircleAvatar(radius: 48, child: Icon(Icons.person, size: 48)),
                SizedBox(height: 12),
                Text('John Doe',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                Text('Flutter Developer'),
                Text('john.doe@email.com'),
              ],
            ),
          ),
          const SizedBox(height: 24),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.description_outlined),
            title: const Text('My Resumes'),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () => Navigator.pushNamed(context, AppRoutes.resumeList),
          ),
          ListTile(
            leading: const Icon(Icons.bookmark_outline),
            title: const Text('Saved Jobs'),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () => Navigator.pushNamed(context, AppRoutes.jobList),
          ),
          ListTile(
            leading: const Icon(Icons.settings_outlined),
            title: const Text('Settings'),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () => Navigator.pushNamed(context, AppRoutes.settings),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.logout, color: Colors.red),
            title: const Text('Logout', style: TextStyle(color: Colors.red)),
            onTap: () =>
                Navigator.pushReplacementNamed(context, AppRoutes.login),
          ),
        ],
      ),
    );
  }
}
