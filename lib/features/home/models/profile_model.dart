class ProfileModel {
  final String id;
  final String email;
  String firstName;
  String lastName;
  String gender;
  String? phoneNumber;
  String? profilePicture;
  final DateTime? createdAt;
  final dynamic jobSeeker; // Kept dynamic as it was null in your sample
  final dynamic recruiter; // Kept dynamic as it was null in your sample

  ProfileModel({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.gender,
    this.phoneNumber,
    this.profilePicture,
    this.createdAt,
    this.jobSeeker,
    this.recruiter,
  });

  // Factory constructor to create a ProfileModel from JSON
  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      id: json['id'] ?? '',
      email: json['email'] ?? '',
      firstName: json['first_name'] ?? '',
      lastName: json['last_name'] ?? '',
      gender: json['gender'] ?? 'NOT_SPECIFIED',
      phoneNumber: json['phone_number'], // Nullable
      profilePicture: json['profile_picture'], // Nullable
      createdAt: json['created_at'] != null
          ? DateTime.parse(json['created_at'])
          : null,
      jobSeeker: json['jobSeeker'],
      recruiter: json['recruiter'],
    );
  }

  // Method to convert ProfileModel instance back to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'first_name': firstName,
      'last_name': lastName,
      'gender': gender,
      'phone_number': phoneNumber,
      'profile_picture': profilePicture,
      'created_at': createdAt?.toIso8601String(),
      'jobSeeker': jobSeeker,
      'recruiter': recruiter,
    };
  }

  // Helper method to get the full name easily in the UI
  String get fullName => '$firstName $lastName';
}