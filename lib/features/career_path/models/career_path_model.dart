import 'milestone_model.dart';

class CareerPathModel {
  final String id;
  final String title;
  final String description;
  final String currentLevel;
  final String targetLevel;
  final List<MilestoneModel> milestones;

  const CareerPathModel({
    required this.id,
    required this.title,
    required this.description,
    required this.currentLevel,
    required this.targetLevel,
    this.milestones = const [],
  });

  factory CareerPathModel.fromJson(Map<String, dynamic> json) {
    return CareerPathModel(
      id: json['id']?.toString() ?? '',
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      currentLevel: json['current_level'] ?? '',
      targetLevel: json['target_level'] ?? '',
      milestones: (json['milestones'] as List<dynamic>?)
              ?.map((e) => MilestoneModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'current_level': currentLevel,
      'target_level': targetLevel,
      'milestones': milestones.map((m) => m.toJson()).toList(),
    };
  }
}
