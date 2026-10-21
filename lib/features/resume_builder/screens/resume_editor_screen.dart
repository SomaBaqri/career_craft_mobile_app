import 'package:flutter/material.dart';
import '../../../app/routes/app_routes.dart';
import '../models/resume_model.dart';
import '../resume_service.dart';

class ResumeEditorScreen extends StatefulWidget {
  const ResumeEditorScreen({super.key});

  @override
  State<ResumeEditorScreen> createState() => _ResumeEditorScreenState();
}

class _ResumeEditorScreenState extends State<ResumeEditorScreen> {
  // ─── Form Controllers ─────────────────────────────────────────────────────
  final _nameCtrl = TextEditingController();
  final _emailCtrl = TextEditingController();
  final _phoneCtrl = TextEditingController();
  final _locationCtrl = TextEditingController();
  final _summaryCtrl = TextEditingController();
  final _skillsCtrl = TextEditingController(); // comma-separated

  ResumeModel? _existingResume;
  // ignore: prefer_final_fields
  bool _isLoading = false;
  bool _isSaving = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_existingResume == null) {
      final arg = ModalRoute.of(context)?.settings.arguments;
      if (arg is ResumeModel) {
        _existingResume = arg;
        _populateFields(arg);
      }
    }
  }

  void _populateFields(ResumeModel resume) {
    _nameCtrl.text = resume.fullName;
    _emailCtrl.text = resume.email;
    _phoneCtrl.text = resume.phone;
    _locationCtrl.text = resume.location;
    _summaryCtrl.text = resume.summary;
    _skillsCtrl.text = resume.skills.join(', ');
  }

  @override
  void dispose() {
    _nameCtrl.dispose();
    _emailCtrl.dispose();
    _phoneCtrl.dispose();
    _locationCtrl.dispose();
    _summaryCtrl.dispose();
    _skillsCtrl.dispose();
    super.dispose();
  }

  // ─── Save ──────────────────────────────────────────────────────────────────

  Future<void> _save() async {
    setState(() => _isSaving = true);

    final skills = _skillsCtrl.text
        .split(',')
        .map((s) => s.trim())
        .where((s) => s.isNotEmpty)
        .toList();

    final resume = (_existingResume ?? ResumeModel.empty()).copyWith(
      fullName: _nameCtrl.text.trim(),
      email: _emailCtrl.text.trim(),
      phone: _phoneCtrl.text.trim(),
      location: _locationCtrl.text.trim(),
      summary: _summaryCtrl.text.trim(),
      skills: skills,
    );

    final result = await ResumeService.instance.saveResume(resume);

    if (!mounted) return;
    setState(() {
      _isSaving = false;
      if (result.isSuccess) {
        _existingResume = result.resume;
      }
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          result.isSuccess ? 'Resume saved successfully! ✅' : result.error!,
        ),
        backgroundColor: result.isSuccess ? Colors.green : Colors.red,
      ),
    );
  }

  // ─── Build ─────────────────────────────────────────────────────────────────

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_existingResume?.id != null ? 'Edit Resume' : 'New Resume'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pushNamed(
              context,
              AppRoutes.resumePreview,
              arguments: _buildCurrentResume(),
            ),
            child: const Text('Preview'),
          ),
        ],
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView(
              padding: const EdgeInsets.all(16),
              children: [
                // ── Personal Info ──────────────────────────────────────────
                _SectionHeader('Personal Info'),
                const SizedBox(height: 8),
                _buildField('Full Name', _nameCtrl, Icons.person_outline),
                _buildField('Email', _emailCtrl, Icons.email_outlined,
                    keyboardType: TextInputType.emailAddress),
                _buildField('Phone', _phoneCtrl, Icons.phone_outlined,
                    keyboardType: TextInputType.phone),
                _buildField(
                    'Location', _locationCtrl, Icons.location_on_outlined),

                // ── Summary ────────────────────────────────────────────────
                _SectionHeader('Professional Summary'),
                const SizedBox(height: 8),
                TextFormField(
                  controller: _summaryCtrl,
                  maxLines: 4,
                  decoration: const InputDecoration(
                    hintText: 'Write a brief professional summary...',
                    border: OutlineInputBorder(),
                  ),
                ),

                // ── Skills ─────────────────────────────────────────────────
                _SectionHeader('Skills'),
                const SizedBox(height: 8),
                TextFormField(
                  controller: _skillsCtrl,
                  decoration: const InputDecoration(
                    hintText: 'Flutter, Laravel, Dart, PHP...',
                    helperText: 'Separate skills with commas',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.psychology_outlined),
                  ),
                ),

                // ── Experience (placeholder — extend with dynamic list) ─────
                _SectionHeader('Work Experience'),
                Card(
                  child: ListTile(
                    leading: const Icon(Icons.add_circle_outline),
                    title: const Text('Add Work Experience'),
                    onTap: () {
                      // TODO: Open experience add dialog / screen
                    },
                  ),
                ),

                // ── Education ──────────────────────────────────────────────
                _SectionHeader('Education'),
                Card(
                  child: ListTile(
                    leading: const Icon(Icons.add_circle_outline),
                    title: const Text('Add Education'),
                    onTap: () {
                      // TODO: Open education add dialog / screen
                    },
                  ),
                ),

                const SizedBox(height: 24),

                // ── Save Button ────────────────────────────────────────────
                FilledButton.icon(
                  onPressed: _isSaving ? null : _save,
                  icon: _isSaving
                      ? const SizedBox(
                          height: 16,
                          width: 16,
                          child: CircularProgressIndicator(
                              strokeWidth: 2, color: Colors.white))
                      : const Icon(Icons.save_outlined),
                  label:
                      Text(_isSaving ? 'Saving...' : 'Save to Profile'),
                ),
                const SizedBox(height: 24),
              ],
            ),
    );
  }

  Widget _buildField(
    String label,
    TextEditingController ctrl,
    IconData icon, {
    TextInputType? keyboardType,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: TextFormField(
        controller: ctrl,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
          prefixIcon: Icon(icon),
        ),
      ),
    );
  }

  ResumeModel _buildCurrentResume() {
    return (_existingResume ?? ResumeModel.empty()).copyWith(
      fullName: _nameCtrl.text.trim(),
      email: _emailCtrl.text.trim(),
      phone: _phoneCtrl.text.trim(),
      location: _locationCtrl.text.trim(),
      summary: _summaryCtrl.text.trim(),
      skills: _skillsCtrl.text
          .split(',')
          .map((s) => s.trim())
          .where((s) => s.isNotEmpty)
          .toList(),
    );
  }
}

class _SectionHeader extends StatelessWidget {
  const _SectionHeader(this.title);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16, bottom: 4),
      child: Text(title,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
    );
  }
}
