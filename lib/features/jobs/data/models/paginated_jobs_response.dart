import 'job_model.dart';

class PaginatedJobsResponse {
  final List<JobModel> jobs;
  final int currentPage;
  final int totalPages;

  const PaginatedJobsResponse({
    required this.jobs,
    this.currentPage = 1,
    this.totalPages = 1,
  });

  factory PaginatedJobsResponse.fromJson(Map<String, dynamic> json) {
    final list = (json['data'] as List<dynamic>?)
            ?.map((e) => JobModel.fromJson(e as Map<String, dynamic>))
            .toList() ??
        [];
    return PaginatedJobsResponse(
      jobs: list,
      currentPage: json['current_page'] ?? 1,
      totalPages: json['last_page'] ?? 1,
    );
  }
}
