class ProfileStatsModel {
  final int applicationsCount;
  final int shortlistedCount;
  final int savedJobsCount;
  final int completionPercentage;

  const ProfileStatsModel({
    this.applicationsCount = 0,
    this.shortlistedCount = 0,
    this.savedJobsCount = 0,
    this.completionPercentage = 0,
  });

  factory ProfileStatsModel.fromJson(Map<String, dynamic> json) {
    return ProfileStatsModel(
      applicationsCount: json['applications_count'] ?? 0,
      shortlistedCount: json['shortlisted_count'] ?? 0,
      savedJobsCount: json['saved_jobs_count'] ?? 0,
      completionPercentage: json['completion_percentage'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'applications_count': applicationsCount,
      'shortlisted_count': shortlistedCount,
      'saved_jobs_count': savedJobsCount,
      'completion_percentage': completionPercentage,
    };
  }
}
