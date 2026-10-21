import '../datasources/application_remote_datasource.dart';
import '../models/application_model.dart';

class ApplicationRepositoryImpl {
  final ApplicationRemoteDataSource remoteDataSource;

  ApplicationRepositoryImpl({ApplicationRemoteDataSource? remoteDataSource})
      : remoteDataSource = remoteDataSource ?? ApplicationRemoteDataSource();

  Future<List<ApplicationModel>> getMyApplications() {
    return remoteDataSource.getMyApplications();
  }

  Future<bool> applyToJob(String jobId, {String? coverLetter, String? resumeId}) {
    return remoteDataSource.applyToJob(jobId, coverLetter: coverLetter, resumeId: resumeId);
  }
}
