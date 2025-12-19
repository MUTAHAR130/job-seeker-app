class ResumeModel {
  final String id;
  final String title;
  final int jobMatchScore;
  final String targetJobTitle;
  final String targetCompany;
  final String thumbnailUrl;
  bool isPrimary;

  ResumeModel({
    required this.id,
    required this.title,
    required this.jobMatchScore,
    required this.targetJobTitle,
    required this.targetCompany,
    required this.thumbnailUrl,
    required this.isPrimary,
  });

  // Factory constructor to create a ResumeModel from JSON
  factory ResumeModel.fromJson(Map<String, dynamic> json) {
    return ResumeModel(
      id: json['id'] ?? '',
      title: json['title'] ?? '',
      jobMatchScore: json['job_match_score'] ?? 0,
      targetJobTitle: json['target_job_title'] ?? '',
      targetCompany: json['target_company'] ?? '',
      thumbnailUrl: json['thumbnail_url'] ?? '',
      isPrimary: json['is_primary'] ?? false,
    );
  }

  // Method to convert ResumeModel instance back to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'job_match_score': jobMatchScore,
      'target_job_title': targetJobTitle,
      'target_company': targetCompany,
      'thumbnail_url': thumbnailUrl,
      'is_primary': isPrimary,
    };
  }
}