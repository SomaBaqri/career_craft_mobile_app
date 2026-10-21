import 'package:flutter/material.dart';
import '../../data/models/employer_dashboard_stats.dart';
import '../../data/repositories/employer_repository_impl.dart';

class EmployerDashboardController extends ChangeNotifier {
  final EmployerRepositoryImpl repository;
  EmployerDashboardStats stats = const EmployerDashboardStats();
  bool isLoading = false;

  EmployerDashboardController({EmployerRepositoryImpl? repository})
      : repository = repository ?? EmployerRepositoryImpl();

  Future<void> fetchStats() async {
    isLoading = true;
    notifyListeners();
    try {
      stats = await repository.getDashboardStats();
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
