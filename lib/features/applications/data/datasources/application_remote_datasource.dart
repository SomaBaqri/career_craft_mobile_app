import '../models/application_model.dart';

class ApplicationRemoteDataSource {
  Future<List<ApplicationModel>> getMyApplications() async {
    return [];
  }

  Future<bool> applyToJob(String jobId, {String? coverLetter, String? resumeId}) async {
    return true;
  }
}
