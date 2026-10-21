import '../models/employer_dashboard_stats.dart';

class EmployerRemoteDataSource {
  Future<EmployerDashboardStats> getDashboardStats() async {
    return const EmployerDashboardStats();
  }

  Future<bool> postJob(Map<String, dynamic> jobData) async {
    return true;
  }
}
