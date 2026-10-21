import '../../../core/network/api_service.dart';
import '../../../core/constants/api_endpoints.dart';
import 'models/job_model.dart';

/// Service layer for all job-related API calls.
class JobService {
  JobService._();
  static final JobService instance = JobService._();

  final _api = ApiService.instance;

  // ─── Fetch Job List ───────────────────────────────────────────────────────

  /// GET /api/jobs?search=...&type=...&location=...&page=...
  Future<JobListResult> getJobs({
    String? search,
    String? type,
    String? location,
    int page = 1,
  }) async {
    final params = <String, String>{'page': '$page'};
    if (search != null && search.isNotEmpty) params['search'] = search;
    if (type != null && type.isNotEmpty) params['type'] = type;
    if (location != null && location.isNotEmpty) params['location'] = location;

    final response = await _api.get(ApiEndpoints.jobs, queryParams: params);

    if (response.isSuccess && response.data != null) {
      final raw = response.data!;
      // Laravel pagination: { data: [...], current_page, last_page, ... }
      final List<dynamic> items =
          raw['data'] as List<dynamic>? ?? raw['jobs'] as List<dynamic>? ?? [];
      final jobs = items
          .whereType<Map<String, dynamic>>()
          .map(JobModel.fromJson)
          .toList();
      final lastPage = (raw['last_page'] as num?)?.toInt() ?? 1;
      return JobListResult.success(jobs: jobs, lastPage: lastPage);
    }
    return JobListResult.failure(response.error ?? 'Failed to load jobs');
  }

  // ─── Fetch Single Job ─────────────────────────────────────────────────────

  /// GET /api/jobs/{id}
  Future<JobDetailResult> getJobById(int id) async {
    final response = await _api.get('${ApiEndpoints.jobs}/$id');

    if (response.isSuccess && response.data != null) {
      final raw = response.data!;
      // Laravel might wrap in 'data' key or return directly
      final jobJson = raw['data'] as Map<String, dynamic>? ?? raw;
      return JobDetailResult.success(JobModel.fromJson(jobJson));
    }
    return JobDetailResult.failure(response.error ?? 'Job not found');
  }

  // ─── Apply for Job ────────────────────────────────────────────────────────

  /// POST /api/jobs/{id}/apply
  Future<String?> applyForJob(int jobId) async {
    final response = await _api.post('${ApiEndpoints.jobs}/$jobId/apply', {});
    if (response.isSuccess) return null; // null = no error
    return response.error ?? 'Failed to apply';
  }
}

// ─── Result Classes ────────────────────────────────────────────────────────

class JobListResult {
  final List<JobModel> jobs;
  final int lastPage;
  final String? error;

  const JobListResult._({required this.jobs, required this.lastPage, this.error});

  bool get isSuccess => error == null;

  factory JobListResult.success({required List<JobModel> jobs, required int lastPage}) =>
      JobListResult._(jobs: jobs, lastPage: lastPage);

  factory JobListResult.failure(String error) =>
      JobListResult._(jobs: const [], lastPage: 1, error: error);
}

class JobDetailResult {
  final JobModel? job;
  final String? error;

  const JobDetailResult._({this.job, this.error});

  bool get isSuccess => error == null;

  factory JobDetailResult.success(JobModel job) => JobDetailResult._(job: job);
  factory JobDetailResult.failure(String error) => JobDetailResult._(error: error);
}
