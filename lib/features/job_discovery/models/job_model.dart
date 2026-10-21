/// Represents a job listing from the Laravel backend.
class JobModel {
  final int id;
  final String title;
  final String company;
  final String location;
  final String type;       // e.g. 'Full-time', 'Part-time', 'Remote'
  final String salary;
  final String description;
  final String requirements;
  final String? logoUrl;
  final DateTime postedAt;

  const JobModel({
    required this.id,
    required this.title,
    required this.company,
    required this.location,
    required this.type,
    required this.salary,
    required this.description,
    required this.requirements,
    this.logoUrl,
    required this.postedAt,
  });

  factory JobModel.fromJson(Map<String, dynamic> json) {
    return JobModel(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String? ?? '',
      company: json['company'] as String? ??
          (json['company_name'] as String? ?? ''),
      location: json['location'] as String? ?? '',
      type: json['type'] as String? ?? json['job_type'] as String? ?? '',
      salary: json['salary'] as String? ?? json['salary_range'] as String? ?? '',
      description: json['description'] as String? ?? '',
      requirements: json['requirements'] as String? ?? '',
      logoUrl: json['logo_url'] as String?,
      postedAt: json['created_at'] != null
          ? DateTime.tryParse(json['created_at'] as String) ?? DateTime.now()
          : DateTime.now(),
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'company': company,
        'location': location,
        'type': type,
        'salary': salary,
        'description': description,
        'requirements': requirements,
        'logo_url': logoUrl,
        'created_at': postedAt.toIso8601String(),
      };
}
