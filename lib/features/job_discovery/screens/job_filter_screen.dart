import 'package:flutter/material.dart';

class JobFilterScreen extends StatefulWidget {
  const JobFilterScreen({super.key});

  @override
  State<JobFilterScreen> createState() => _JobFilterScreenState();
}

class _JobFilterScreenState extends State<JobFilterScreen> {
  String _selectedType = 'All';
  RangeValues _salaryRange = const RangeValues(1000, 10000);

  final List<String> _jobTypes = ['All', 'Full-time', 'Part-time', 'Remote', 'Contract'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Filter Jobs')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Job Type',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              children: _jobTypes.map((type) {
                return ChoiceChip(
                  label: Text(type),
                  selected: _selectedType == type,
                  onSelected: (_) => setState(() => _selectedType = type),
                );
              }).toList(),
            ),
            const SizedBox(height: 24),
            const Text('Salary Range',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
            RangeSlider(
              values: _salaryRange,
              min: 0,
              max: 20000,
              divisions: 20,
              labels: RangeLabels(
                '\$${_salaryRange.start.round()}',
                '\$${_salaryRange.end.round()}',
              ),
              onChanged: (v) => setState(() => _salaryRange = v),
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Apply Filters'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
