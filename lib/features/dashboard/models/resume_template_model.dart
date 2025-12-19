class ResumeTemplateModel {
  final String id;
  final String name;
  final String category;
  final String? description;
  final String thumbnailUrl;
  final String? htmlContent;
  final String templatePath;
  final bool isPremium;
  final bool isActive;
  final int popularityScore;
  final String atsTag;

  ResumeTemplateModel({
    required this.id,
    required this.name,
    required this.category,
    this.description,
    required this.thumbnailUrl,
    this.htmlContent,
    required this.templatePath,
    required this.isPremium,
    required this.isActive,
    required this.popularityScore,
    required this.atsTag,
  });

  // Factory constructor to create a model from JSON
  factory ResumeTemplateModel.fromJson(Map<String, dynamic> json) {
    return ResumeTemplateModel(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      category: json['category'] ?? 'PROFESSIONAL',
      description: json['description'], // Can be null
      thumbnailUrl: json['thumbnail_url'] ?? '',
      htmlContent: json['html_content'], // Can be null
      templatePath: json['template_path'] ?? '',
      isPremium: json['is_premium'] ?? false,
      isActive: json['is_active'] ?? true,
      popularityScore: json['popularity_score'] ?? 0,
      atsTag: json['ats_tag'] ?? 'BASIC_ATS_READY',
    );
  }

  // Method to convert model back to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'category': category,
      'description': description,
      'thumbnail_url': thumbnailUrl,
      'html_content': htmlContent,
      'template_path': templatePath,
      'is_premium': isPremium,
      'is_active': isActive,
      'popularity_score': popularityScore,
      'ats_tag': atsTag,
    };
  }
}