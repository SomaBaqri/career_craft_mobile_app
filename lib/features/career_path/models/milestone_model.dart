class MilestoneModel {
  final int step;
  final String title;
  final String status;
  final String description;

  const MilestoneModel({
    required this.step,
    required this.title,
    required this.status,
    this.description = '',
  });

  factory MilestoneModel.fromJson(Map<String, dynamic> json) {
    return MilestoneModel(
      step: json['step'] ?? 1,
      title: json['title'] ?? '',
      status: json['status'] ?? 'Upcoming',
      description: json['description'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'step': step,
      'title': title,
      'status': status,
      'description': description,
    };
  }
}
