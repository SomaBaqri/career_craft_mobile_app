import 'package:flutter/material.dart';
import '../../../app/routes/app_routes.dart';

class TemplatePickerScreen extends StatelessWidget {
  const TemplatePickerScreen({super.key});

  static const List<String> _templates = [
    'Classic',
    'Modern',
    'Minimal',
    'Professional',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Choose Template')),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          childAspectRatio: 0.75,
        ),
        itemCount: _templates.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () => Navigator.pushNamed(context, AppRoutes.resumeEditor),
            child: Card(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.description_outlined, size: 48),
                  const SizedBox(height: 8),
                  Text(_templates[index]),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
