class EmployerDashboardStats {
  final int activeJobs;
  final int totalApplicants;
  final int shortlisted;

  const EmployerDashboardStats({
    this.activeJobs = 0,
    this.totalApplicants = 0,
    this.shortlisted = 0,
  });

  factory EmployerDashboardStats.fromJson(Map<String, dynamic> json) {
    return EmployerDashboardStats(
      activeJobs: json['active_jobs'] ?? 0,
      totalApplicants: json['total_applicants'] ?? 0,
      shortlisted: json['shortlisted'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'active_jobs': activeJobs,
      'total_applicants': totalApplicants,
      'shortlisted': shortlisted,
    };
  }
}
