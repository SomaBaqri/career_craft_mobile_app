class ApplicationModel {
  final String id;
  final String jobTitle;
  final String companyName;
  final String status;
  final DateTime? appliedAt;

  const ApplicationModel({
    required this.id,
    required this.jobTitle,
    required this.companyName,
    required this.status,
    this.appliedAt,
  });

  factory ApplicationModel.fromJson(Map<String, dynamic> json) {
    return ApplicationModel(
      id: json['id']?.toString() ?? '',
      jobTitle: json['job_title'] ?? '',
      companyName: json['company_name'] ?? '',
      status: json['status'] ?? 'pending',
      appliedAt: json['applied_at'] != null ? DateTime.tryParse(json['applied_at']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'job_title': jobTitle,
      'company_name': companyName,
      'status': status,
      'applied_at': appliedAt?.toIso8601String(),
    };
  }
}
