class ProfileDetailsModel {
  // Basic Information
  final String id;
  final String email;
  final String firstName;
  final String lastName;
  final String gender;
  final String userType;
  final String accountStatus;
  final bool isEmailVerified;
  final bool twoFactorEnabled;
  final DateTime? createdAt;
  final DateTime? deletedAt;

  // Profile Media & Contact
  final String? profilePicture;
  final String? phoneNumber;
  final String? address;
  final String? city;
  final String? state;
  final String? country;
  final String? postalCode;

  // Social & External Links
  final String? linkedin;
  final String? github;
  final String? website;
  final List<dynamic> connectedAccounts;

  // Account Relations
  final String planId;
  final dynamic jobSeeker;
  final dynamic recruiter;

  ProfileDetailsModel({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.gender,
    required this.userType,
    required this.accountStatus,
    required this.isEmailVerified,
    required this.twoFactorEnabled,
    this.createdAt,
    this.deletedAt,
    this.profilePicture,
    this.phoneNumber,
    this.address,
    this.city,
    this.state,
    this.country,
    this.postalCode,
    this.linkedin,
    this.github,
    this.website,
    required this.connectedAccounts,
    required this.planId,
    this.jobSeeker,
    this.recruiter,
  });

  factory ProfileDetailsModel.fromJson(Map<String, dynamic> json) {
    return ProfileDetailsModel(
      id: json['id'] ?? '',
      email: json['email'] ?? '',
      firstName: json['first_name'] ?? '',
      lastName: json['last_name'] ?? '',
      gender: json['gender'] ?? 'NOT_SPECIFIED',
      userType: json['user_type'] ?? '',
      accountStatus: json['account_status'] ?? 'ACTIVE',
      isEmailVerified: json['is_email_verified'] ?? false,
      twoFactorEnabled: json['two_factor_enabled'] ?? false,
      createdAt: json['created_at'] != null ? DateTime.parse(json['created_at']) : null,
      deletedAt: json['deleted_at'] != null ? DateTime.parse(json['deleted_at']) : null,
      profilePicture: json['profile_picture'],
      phoneNumber: json['phone_number'],
      address: json['address'],
      city: json['city'],
      state: json['state'],
      country: json['country'],
      postalCode: json['postal_code'],
      linkedin: json['linkedin'],
      github: json['github'],
      website: json['website'],
      connectedAccounts: json['connected_accounts'] ?? [],
      planId: json['plan_id'] ?? '',
      jobSeeker: json['job_seeker'],
      recruiter: json['recruiter'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'first_name': firstName,
      'last_name': lastName,
      'gender': gender,
      'user_type': userType,
      'account_status': accountStatus,
      'is_email_verified': isEmailVerified,
      'two_factor_enabled': twoFactorEnabled,
      'created_at': createdAt?.toIso8601String(),
      'deleted_at': deletedAt?.toIso8601String(),
      'profile_picture': profilePicture,
      'phone_number': phoneNumber,
      'address': address,
      'city': city,
      'state': state,
      'country': country,
      'postal_code': postalCode,
      'linkedin': linkedin,
      'github': github,
      'website': website,
      'connected_accounts': connectedAccounts,
      'plan_id': planId,
      'job_seeker': jobSeeker,
      'recruiter': recruiter,
    };
  }

  // Helper for UI
  String get fullName => '$firstName $lastName';
}