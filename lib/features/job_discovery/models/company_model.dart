class CompanyModel {
  final String id;
  final String name;
  final String? logoUrl;
  final String location;
  final String description;
  final int openPositionsCount;

  const CompanyModel({
    required this.id,
    required this.name,
    this.logoUrl,
    this.location = '',
    this.description = '',
    this.openPositionsCount = 0,
  });

  factory CompanyModel.fromJson(Map<String, dynamic> json) {
    return CompanyModel(
      id: json['id']?.toString() ?? '',
      name: json['name'] ?? '',
      logoUrl: json['logo_url'],
      location: json['location'] ?? '',
      description: json['description'] ?? '',
      openPositionsCount: json['open_positions_count'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      if (logoUrl != null) 'logo_url': logoUrl,
      'location': location,
      'description': description,
      'open_positions_count': openPositionsCount,
    };
  }
}
