class UserModel {
  final String id;
  final String email;
  final String firstName;
  final String lastName;
  final String gender;
  final String userType;
  final DateTime createdAt;
  final String accountStatus;
  final bool isEmailVerified;
  final List<dynamic> connectedAccounts;
  final String? profilePicture;
  final String? phoneNumber;
  final String? address;
  final String? city;
  final String? state;
  final String? country;
  final String? postalCode;
  final String? linkedin;
  final String? github;
  final String? website;
  final bool twoFactorEnabled;
  final DateTime? deletedAt;
  final String planId;

  UserModel({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.gender,
    required this.userType,
    required this.createdAt,
    required this.accountStatus,
    required this.isEmailVerified,
    required this.connectedAccounts,
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
    required this.twoFactorEnabled,
    this.deletedAt,
    required this.planId,
  });

  // Factory constructor to create a User from JSON
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] ?? '',
      email: json['email'] ?? '',
      firstName: json['first_name'] ?? '',
      lastName: json['last_name'] ?? '',
      gender: json['gender'] ?? 'NOT_SPECIFIED',
      userType: json['user_type'] ?? '',
      createdAt: DateTime.parse(json['created_at']),
      accountStatus: json['account_status'] ?? '',
      isEmailVerified: json['is_email_verified'] ?? false,
      connectedAccounts: List<dynamic>.from(json['connected_accounts'] ?? []),
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
      twoFactorEnabled: json['two_factor_enabled'] ?? false,
      deletedAt: json['deleted_at'] != null ? DateTime.parse(json['deleted_at']) : null,
      planId: json['plan_id'] ?? '',
    );
  }

  // Method to convert User instance back to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'first_name': firstName,
      'last_name': lastName,
      'gender': gender,
      'user_type': userType,
      'created_at': createdAt.toIso8601String(),
      'account_status': accountStatus,
      'is_email_verified': isEmailVerified,
      'connected_accounts': connectedAccounts,
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
      'two_factor_enabled': twoFactorEnabled,
      'deleted_at': deletedAt?.toIso8601String(),
      'plan_id': planId,
    };
  }
}