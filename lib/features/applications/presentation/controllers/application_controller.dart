import 'package:flutter/material.dart';
import '../../data/models/application_model.dart';
import '../../data/repositories/application_repository_impl.dart';

class ApplicationController extends ChangeNotifier {
  final ApplicationRepositoryImpl repository;
  List<ApplicationModel> applications = [];
  bool isLoading = false;

  ApplicationController({ApplicationRepositoryImpl? repository})
      : repository = repository ?? ApplicationRepositoryImpl();

  Future<void> fetchApplications() async {
    isLoading = true;
    notifyListeners();
    try {
      applications = await repository.getMyApplications();
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
