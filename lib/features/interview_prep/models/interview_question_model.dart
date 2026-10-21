class InterviewQuestionModel {
  final String id;
  final String question;
  final String category;
  final String suggestedAnswer;
  final List<String> tips;

  const InterviewQuestionModel({
    required this.id,
    required this.question,
    required this.category,
    this.suggestedAnswer = '',
    this.tips = const [],
  });

  factory InterviewQuestionModel.fromJson(Map<String, dynamic> json) {
    return InterviewQuestionModel(
      id: json['id']?.toString() ?? '',
      question: json['question'] ?? '',
      category: json['category'] ?? '',
      suggestedAnswer: json['suggested_answer'] ?? '',
      tips: (json['tips'] as List<dynamic>?)?.map((e) => e.toString()).toList() ?? const [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'question': question,
      'category': category,
      'suggested_answer': suggestedAnswer,
      'tips': tips,
    };
  }
}
