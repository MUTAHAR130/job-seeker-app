class JobDataModel {
  final String company;
  final String role;
  final String description;
  final List<String> keywords;
  final List<String> requirements;
  final List<String> skills;
  final String internalJobId;

  JobDataModel({
    required this.company,
    required this.role,
    required this.description,
    required this.keywords,
    required this.requirements,
    required this.skills,
    required this.internalJobId,
  });

  // Create a JobDataModel from a JSON Map
  factory JobDataModel.fromJson(Map<String, dynamic> json) {
    return JobDataModel(
      company: json['company'] as String? ?? '',
      role: json['role'] as String? ?? '',
      description: json['description'] as String? ?? '',
      // Ensure the lists are cast correctly
      keywords: List<String>.from(json['keywords'] ?? []),
      requirements: List<String>.from(json['requirements'] ?? []),
      skills: List<String>.from(json['skills'] ?? []),
      internalJobId: json['internal_job_id'] as String? ?? '',
    );
  }

  // Convert a JobDataModel instance to a JSON Map
  Map<String, dynamic> toJson() {
    return {
      'company': company,
      'role': role,
      'description': description,
      'keywords': keywords,
      'requirements': requirements,
      'skills': skills,
      'internal_job_id': internalJobId,
    };
  }
}