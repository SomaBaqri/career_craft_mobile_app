import 'package:flutter/material.dart';
import '../../data/models/job_model.dart';
import '../../data/repositories/job_repository_impl.dart';

class JobListController extends ChangeNotifier {
  final JobRepositoryImpl repository;
  List<JobModel> jobs = [];
  bool isLoading = false;

  JobListController({JobRepositoryImpl? repository})
      : repository = repository ?? JobRepositoryImpl();

  Future<void> fetchJobs() async {
    isLoading = true;
    notifyListeners();
    try {
      final res = await repository.getJobs();
      jobs = res.jobs;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
