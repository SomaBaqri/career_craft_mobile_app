import 'package:flutter/material.dart';
import '../../data/repositories/employer_repository_impl.dart';

class PostJobController extends ChangeNotifier {
  final EmployerRepositoryImpl repository;
  bool isSubmitting = false;

  PostJobController({EmployerRepositoryImpl? repository})
      : repository = repository ?? EmployerRepositoryImpl();

  Future<bool> submitJob(Map<String, dynamic> jobData) async {
    isSubmitting = true;
    notifyListeners();
    try {
      return await repository.postJob(jobData);
    } finally {
      isSubmitting = false;
      notifyListeners();
    }
  }
}
