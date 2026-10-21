class QuestionModel {
  final String id;
  final String questionText;
  final List<String> options;
  final int correctOptionIndex;

  const QuestionModel({
    required this.id,
    required this.questionText,
    required this.options,
    required this.correctOptionIndex,
  });

  factory QuestionModel.fromJson(Map<String, dynamic> json) {
    return QuestionModel(
      id: json['id']?.toString() ?? '',
      questionText: json['question_text'] ?? '',
      options: (json['options'] as List<dynamic>?)?.map((e) => e.toString()).toList() ?? const [],
      correctOptionIndex: json['correct_option_index'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'question_text': questionText,
      'options': options,
      'correct_option_index': correctOptionIndex,
    };
  }
}
