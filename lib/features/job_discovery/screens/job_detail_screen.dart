import 'package:flutter/material.dart';
import '../job_service.dart';
import '../models/job_model.dart';

class JobDetailScreen extends StatefulWidget {
  const JobDetailScreen({super.key});

  @override
  State<JobDetailScreen> createState() => _JobDetailScreenState();
}

class _JobDetailScreenState extends State<JobDetailScreen> {
  JobModel? _job;
  bool _isLoading = false;
  bool _isApplying = false;
  String? _error;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Job can be passed directly (fast path) or fetched by id
    if (_job == null) {
      final arg = ModalRoute.of(context)?.settings.arguments;
      if (arg is JobModel) {
        _job = arg;
      } else if (arg is int) {
        _loadJob(arg);
      }
    }
  }

  Future<void> _loadJob(int id) async {
    setState(() {
      _isLoading = true;
      _error = null;
    });
    final result = await JobService.instance.getJobById(id);
    if (!mounted) return;
    setState(() {
      _isLoading = false;
      if (result.isSuccess) {
        _job = result.job;
      } else {
        _error = result.error;
      }
    });
  }

  Future<void> _applyForJob() async {
    if (_job == null) return;
    setState(() => _isApplying = true);
    final error = await JobService.instance.applyForJob(_job!.id);
    if (!mounted) return;
    setState(() => _isApplying = false);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(error ?? 'Application submitted successfully! ✅'),
        backgroundColor: error != null ? Colors.red : Colors.green,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Job Details'),
        actions: [
          IconButton(
            icon: const Icon(Icons.bookmark_border),
            onPressed: () {},
          ),
        ],
      ),
      body: _buildBody(),
      bottomNavigationBar: _job != null
          ? Padding(
              padding: const EdgeInsets.all(16),
              child: FilledButton(
                onPressed: _isApplying ? null : _applyForJob,
                child: _isApplying
                    ? const SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          color: Colors.white,
                        ),
                      )
                    : const Text('Apply Now'),
              ),
            )
          : null,
    );
  }

  Widget _buildBody() {
    if (_isLoading) {
      return const Center(child: CircularProgressIndicator());
    }
    if (_error != null) {
      return Center(child: Text(_error!));
    }
    if (_job == null) {
      return const Center(child: Text('No job data available.'));
    }

    final job = _job!;
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ── Header ────────────────────────────────────────────────────
          Row(
            children: [
              CircleAvatar(
                radius: 28,
                backgroundColor:
                    Theme.of(context).colorScheme.primaryContainer,
                child: Text(
                  job.company.isNotEmpty
                      ? job.company[0].toUpperCase()
                      : 'J',
                  style: const TextStyle(
                      fontSize: 22, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(job.title,
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                    Text(job.company,
                        style: const TextStyle(color: Colors.grey)),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),

          // ── Meta Chips ─────────────────────────────────────────────────
          Wrap(
            spacing: 8,
            runSpacing: 4,
            children: [
              _MetaChip(icon: Icons.location_on_outlined, label: job.location),
              _MetaChip(icon: Icons.work_outline, label: job.type),
              _MetaChip(icon: Icons.attach_money, label: job.salary),
            ],
          ),
          const Divider(height: 32),

          // ── Description ────────────────────────────────────────────────
          const Text('Job Description',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
          const SizedBox(height: 8),
          Text(job.description.isNotEmpty
              ? job.description
              : 'No description provided.'),
          const SizedBox(height: 16),

          // ── Requirements ───────────────────────────────────────────────
          const Text('Requirements',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
          const SizedBox(height: 8),
          Text(job.requirements.isNotEmpty
              ? job.requirements
              : 'No requirements listed.'),

          const SizedBox(height: 80), // space for bottom button
        ],
      ),
    );
  }
}

class _MetaChip extends StatelessWidget {
  const _MetaChip({required this.icon, required this.label});
  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Chip(
      avatar: Icon(icon, size: 16),
      label: Text(label),
      padding: EdgeInsets.zero,
    );
  }
}
