class EducationModel {
  final String degree;
  final String institution;
  final String year;

  const EducationModel({
    required this.degree,
    required this.institution,
    required this.year,
  });

  factory EducationModel.fromJson(Map<String, dynamic> json) {
    return EducationModel(
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
