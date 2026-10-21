class ProfileModel {
  final String id;
  final String name;
  final String email;
  final String title;
  final List<String> skills;

  const ProfileModel({
    required this.id,
    required this.name,
    required this.email,
    this.title = '',
    this.skills = const [],
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      id: json['id']?.toString() ?? '',
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      title: json['title'] ?? '',
      skills: (json['skills'] as List<dynamic>?)?.map((e) => e.toString()).toList() ?? const [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'title': title,
      'skills': skills,
    };
  }
}
