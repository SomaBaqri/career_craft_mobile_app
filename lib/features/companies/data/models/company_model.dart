class CompanyModel {
  final String id;
  final String name;
  final String description;
  final String website;

  const CompanyModel({
    required this.id,
    required this.name,
    this.description = '',
    this.website = '',
  });

  factory CompanyModel.fromJson(Map<String, dynamic> json) {
    return CompanyModel(
      id: json['id']?.toString() ?? '',
      name: json['name'] ?? '',
      description: json['description'] ?? '',
      website: json['website'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'website': website,
    };
  }
}
