class ExperienceModel {
  final String jobTitle;
  final String company;
  final String startDate;
  final String? endDate;
  final String description;

  const ExperienceModel({
    required this.jobTitle,
    required this.company,
    required this.startDate,
    this.endDate,
    required this.description,
  });

  factory ExperienceModel.fromJson(Map<String, dynamic> json) {
    return ExperienceModel(
      jobTitle: json['job_title'] as String? ?? '',
      company: json['company'] as String? ?? '',
      startDate: json['start_date'] as String? ?? '',
      endDate: json['end_date'] as String?,
      description: json['description'] as String? ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
        'job_title': jobTitle,
        'company': company,
        'start_date': startDate,
        if (endDate != null) 'end_date': endDate,
        'description': description,
      };
}
