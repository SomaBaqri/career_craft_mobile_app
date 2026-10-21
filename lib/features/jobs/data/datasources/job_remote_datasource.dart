import '../models/job_model.dart';
import '../models/paginated_jobs_response.dart';

class JobRemoteDataSource {
  Future<PaginatedJobsResponse> getJobs({int page = 1}) async {
    return const PaginatedJobsResponse(jobs: []);
  }

  Future<JobModel?> getJobById(String id) async {
    return null;
  }
}
