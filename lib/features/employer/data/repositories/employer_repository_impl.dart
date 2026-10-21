import '../datasources/employer_remote_datasource.dart';
import '../models/employer_dashboard_stats.dart';

class EmployerRepositoryImpl {
  final EmployerRemoteDataSource remoteDataSource;

  EmployerRepositoryImpl({EmployerRemoteDataSource? remoteDataSource})
      : remoteDataSource = remoteDataSource ?? EmployerRemoteDataSource();

  Future<EmployerDashboardStats> getDashboardStats() {
    return remoteDataSource.getDashboardStats();
  }

  Future<bool> postJob(Map<String, dynamic> jobData) {
    return remoteDataSource.postJob(jobData);
  }
}
