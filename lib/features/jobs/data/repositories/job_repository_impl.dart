import '../datasources/job_remote_datasource.dart';
import '../models/job_model.dart';
import '../models/paginated_jobs_response.dart';

class JobRepositoryImpl {
  final JobRemoteDataSource remoteDataSource;

  JobRepositoryImpl({JobRemoteDataSource? remoteDataSource})
      : remoteDataSource = remoteDataSource ?? JobRemoteDataSource();

  Future<PaginatedJobsResponse> getJobs({int page = 1}) {
    return remoteDataSource.getJobs(page: page);
  }

  Future<JobModel?> getJobById(String id) {
    return remoteDataSource.getJobById(id);
  }
}
