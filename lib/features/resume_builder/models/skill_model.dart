class SkillModel {
  final String name;
  final String level;

  const SkillModel({
    required this.name,
    this.level = 'Intermediate',
  });

  factory SkillModel.fromJson(Map<String, dynamic> json) {
    return SkillModel(
      name: json['name'] as String? ?? '',
      level: json['level'] as String? ?? 'Intermediate',
    );
  }

  Map<String, dynamic> toJson() => {
        'name': name,
        'level': level,
      };
}
