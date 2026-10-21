/// Full resume model mirroring the Laravel backend schema.
class ResumeModel {
  final int? id;
  final String fullName;
  final String email;
  final String phone;
  final String location;
  final String summary;
  final List<ExperienceEntry> experience;
  final List<EducationEntry> education;
  final List<String> skills;
  final String? templateId;

  const ResumeModel({
    this.id,
    required this.fullName,
    required this.email,
    required this.phone,
    required this.location,
    required this.summary,
    this.experience = const [],
    this.education = const [],
    this.skills = const [],
    this.templateId,
  });

  factory ResumeModel.empty() => const ResumeModel(
        fullName: '',
        email: '',
        phone: '',
        location: '',
        summary: '',
      );

  factory ResumeModel.fromJson(Map<String, dynamic> json) {
    return ResumeModel(
      id: (json['id'] as num?)?.toInt(),
      fullName: json['full_name'] as String? ?? '',
      email: json['email'] as String? ?? '',
      phone: json['phone'] as String? ?? '',
      location: json['location'] as String? ?? '',
      summary: json['summary'] as String? ?? '',
      experience: (json['experience'] as List<dynamic>? ?? [])
          .whereType<Map<String, dynamic>>()
          .map(ExperienceEntry.fromJson)
          .toList(),
      education: (json['education'] as List<dynamic>? ?? [])
          .whereType<Map<String, dynamic>>()
          .map(EducationEntry.fromJson)
          .toList(),
      skills: (json['skills'] as List<dynamic>? ?? [])
          .map((e) => e.toString())
          .toList(),
      templateId: json['template_id'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        if (id != null) 'id': id,
        'full_name': fullName,
        'email': email,
        'phone': phone,
        'location': location,
        'summary': summary,
        'experience': experience.map((e) => e.toJson()).toList(),
        'education': education.map((e) => e.toJson()).toList(),
        'skills': skills,
        if (templateId != null) 'template_id': templateId,
      };

  ResumeModel copyWith({
    int? id,
    String? fullName,
    String? email,
    String? phone,
    String? location,
    String? summary,
    List<ExperienceEntry>? experience,
    List<EducationEntry>? education,
    List<String>? skills,
    String? templateId,
  }) {
    return ResumeModel(
      id: id ?? this.id,
      fullName: fullName ?? this.fullName,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      location: location ?? this.location,
      summary: summary ?? this.summary,
      experience: experience ?? this.experience,
      education: education ?? this.education,
      skills: skills ?? this.skills,
      templateId: templateId ?? this.templateId,
    );
  }
}

// ─── Experience Entry ────────────────────────────────────────────────────────

class ExperienceEntry {
  final String jobTitle;
  final String company;
  final String startDate;
  final String? endDate; // null = present
  final String description;

  const ExperienceEntry({
    required this.jobTitle,
    required this.company,
    required this.startDate,
    this.endDate,
    required this.description,
  });

  factory ExperienceEntry.fromJson(Map<String, dynamic> json) {
    return ExperienceEntry(
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

// ─── Education Entry ─────────────────────────────────────────────────────────

class EducationEntry {
  final String degree;
  final String institution;
  final String year;

  const EducationEntry({
    required this.degree,
    required this.institution,
    required this.year,
  });

  factory EducationEntry.fromJson(Map<String, dynamic> json) {
    return EducationEntry(
      degree: json['degree'] as String? ?? '',
      institution: json['institution'] as String? ?? '',
      year: json['year'] as String? ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
        'degree': degree,
        'institution': institution,
        'year': year,
      };
}
