import 'package:flutter/material.dart';
import '../../../app/routes/app_routes.dart';
import '../job_service.dart';
import '../models/job_model.dart';

class JobListScreen extends StatefulWidget {
  const JobListScreen({super.key});

  @override
  State<JobListScreen> createState() => _JobListScreenState();
}

class _JobListScreenState extends State<JobListScreen> {
  final _searchController = TextEditingController();
  final _scrollController = ScrollController();

  List<JobModel> _jobs = [];
  bool _isLoading = false;
  bool _isLoadingMore = false;
  String? _error;
  int _page = 1;
  int _lastPage = 1;
  String _searchQuery = '';

  @override
  void initState() {
    super.initState();
    _fetchJobs();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _searchController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  // ─── Data Fetching ─────────────────────────────────────────────────────

  Future<void> _fetchJobs({bool refresh = false}) async {
    if (refresh) {
      _page = 1;
      _jobs = [];
    }
    setState(() {
      _isLoading = _page == 1;
      _isLoadingMore = _page > 1;
      _error = null;
    });

    final result = await JobService.instance.getJobs(
      search: _searchQuery.isNotEmpty ? _searchQuery : null,
      page: _page,
    );

    if (!mounted) return;
    setState(() {
      _isLoading = false;
      _isLoadingMore = false;
      if (result.isSuccess) {
        _jobs = [..._jobs, ...result.jobs];
        _lastPage = result.lastPage;
      } else {
        _error = result.error;
      }
    });
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
            _scrollController.position.maxScrollExtent - 200 &&
        !_isLoadingMore &&
        _page < _lastPage) {
      _page++;
      _fetchJobs();
    }
  }

  void _onSearch(String query) {
    _searchQuery = query;
    _fetchJobs(refresh: true);
  }

  // ─── Build ─────────────────────────────────────────────────────────────

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Job Discovery'),
        actions: [
          IconButton(
            icon: const Icon(Icons.filter_list),
            onPressed: () => Navigator.pushNamed(context, AppRoutes.jobFilter),
          ),
        ],
      ),
      body: Column(
        children: [
          // ── Search Bar ──────────────────────────────────────────────────
          Padding(
            padding: const EdgeInsets.all(12),
            child: SearchBar(
              controller: _searchController,
              hintText: 'Search jobs...',
              leading: const Icon(Icons.search),
              onChanged: _onSearch,
            ),
          ),

          // ── Body ────────────────────────────────────────────────────────
          Expanded(child: _buildBody()),
        ],
      ),
    );
  }

  Widget _buildBody() {
    if (_isLoading) {
      return const Center(child: CircularProgressIndicator());
    }
    if (_error != null && _jobs.isEmpty) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.wifi_off, size: 48, color: Colors.grey),
            const SizedBox(height: 12),
            Text(_error!, textAlign: TextAlign.center),
            const SizedBox(height: 16),
            FilledButton.tonal(
              onPressed: () => _fetchJobs(refresh: true),
              child: const Text('Retry'),
            ),
          ],
        ),
      );
    }
    if (_jobs.isEmpty) {
      return const Center(child: Text('No jobs found.'));
    }

    return RefreshIndicator(
      onRefresh: () => _fetchJobs(refresh: true),
      child: ListView.separated(
        controller: _scrollController,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        itemCount: _jobs.length + (_isLoadingMore ? 1 : 0),
        separatorBuilder: (_, __) => const SizedBox(height: 8),
        itemBuilder: (context, index) {
          if (index == _jobs.length) {
            return const Padding(
              padding: EdgeInsets.all(16),
              child: Center(child: CircularProgressIndicator()),
            );
          }
          final job = _jobs[index];
          return _JobCard(
            job: job,
            onTap: () => Navigator.pushNamed(
              context,
              AppRoutes.jobDetail,
              arguments: job,
            ),
          );
        },
      ),
    );
  }
}

// ─── Job Card Widget ────────────────────────────────────────────────────────

class _JobCard extends StatelessWidget {
  const _JobCard({required this.job, required this.onTap});
  final JobModel job;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Theme.of(context).colorScheme.primaryContainer,
          child: Text(
            job.company.isNotEmpty ? job.company[0].toUpperCase() : 'J',
            style: TextStyle(
              color: Theme.of(context).colorScheme.onPrimaryContainer,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        title: Text(job.title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontWeight: FontWeight.w600)),
        subtitle: Text('${job.company} • ${job.location}',
            maxLines: 1, overflow: TextOverflow.ellipsis),
        trailing: Text(
          job.salary,
          style: TextStyle(
            color: Theme.of(context).colorScheme.primary,
            fontWeight: FontWeight.w600,
          ),
        ),
        onTap: onTap,
      ),
    );
  }
}
