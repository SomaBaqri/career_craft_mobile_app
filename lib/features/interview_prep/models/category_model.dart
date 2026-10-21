class CategoryModel {
  final String id;
  final String name;
  final String description;
  final int questionCount;

  const CategoryModel({
    required this.id,
    required this.name,
    this.description = '',
    this.questionCount = 0,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['id']?.toString() ?? '',
      name: json['name'] ?? '',
      description: json['description'] ?? '',
      questionCount: json['question_count'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'question_count': questionCount,
    };
  }
}
