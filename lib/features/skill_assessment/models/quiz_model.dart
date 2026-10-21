import 'question_model.dart';

class QuizModel {
  final String id;
  final String title;
  final String category;
  final int durationMinutes;
  final List<QuestionModel> questions;

  const QuizModel({
    required this.id,
    required this.title,
    required this.category,
    this.durationMinutes = 15,
    this.questions = const [],
  });

  factory QuizModel.fromJson(Map<String, dynamic> json) {
    return QuizModel(
      id: json['id']?.toString() ?? '',
      title: json['title'] ?? '',
      category: json['category'] ?? '',
      durationMinutes: json['duration_minutes'] ?? 15,
      questions: (json['questions'] as List<dynamic>?)
              ?.map((e) => QuestionModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'category': category,
      'duration_minutes': durationMinutes,
      'questions': questions.map((q) => q.toJson()).toList(),
    };
  }
}
