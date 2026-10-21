class ResultModel {
  final String id;
  final String quizTitle;
  final int score;
  final int totalQuestions;
  final bool passed;

  const ResultModel({
    required this.id,
    required this.quizTitle,
    required this.score,
    required this.totalQuestions,
    required this.passed,
  });

  double get percentage => totalQuestions > 0 ? (score / totalQuestions) * 100 : 0.0;

  factory ResultModel.fromJson(Map<String, dynamic> json) {
    return ResultModel(
      id: json['id']?.toString() ?? '',
      quizTitle: json['quiz_title'] ?? '',
      score: json['score'] ?? 0,
      totalQuestions: json['total_questions'] ?? 0,
      passed: json['passed'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'quiz_title': quizTitle,
      'score': score,
      'total_questions': totalQuestions,
      'passed': passed,
    };
  }
}
