import 'package:flutter/material.dart';

class MockInterviewScreen extends StatefulWidget {
  const MockInterviewScreen({super.key});

  @override
  State<MockInterviewScreen> createState() => _MockInterviewScreenState();
}

class _MockInterviewScreenState extends State<MockInterviewScreen> {
  bool _started = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Mock Interview')),
      body: _started ? _buildSession() : _buildIntro(),
    );
  }

  Widget _buildIntro() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.mic_outlined, size: 80),
            const SizedBox(height: 16),
            const Text('Ready to Practice?',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            const Text(
              'You will be presented with common interview questions. Answer each one within the time limit.',
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: () => setState(() => _started = true),
              child: const Text('Start Session'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSession() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Card(
            child: Padding(
              padding: EdgeInsets.all(24),
              child: Text(
                'Tell me about yourself.',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          const SizedBox(height: 24),
          const Text('Your answer:',
              style: TextStyle(fontWeight: FontWeight.w600)),
          const SizedBox(height: 8),
          const TextField(
            maxLines: 6,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Type your answer here...',
            ),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {},
            child: const Text('Next Question'),
          ),
        ],
      ),
    );
  }
}
