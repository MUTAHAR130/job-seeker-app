class MessageModel {
  final String id;
  final String content;
  final DateTime createdAt;
  final MessageSender sender;
  final String? replyTo;
  final List<dynamic> attachments;
  final String threadId;

  MessageModel({
    required this.id,
    required this.content,
    required this.createdAt,
    required this.sender,
    this.replyTo,
    required this.attachments,
    required this.threadId,
  });

  factory MessageModel.fromJson(Map<String, dynamic> json) {
    return MessageModel(
      id: json['id'] ?? '',
      content: json['content'] ?? '',
      createdAt: DateTime.parse(
        json['createdAt'] ?? json['sent_at'] ?? DateTime.now().toIso8601String(),
      ),
      sender: MessageSender.fromJson(json['sender'] ?? {}),
      replyTo: json['reply_to'],
      attachments: json['attachments'] ?? [],
      threadId: json['thread_id'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'content': content,
      'createdAt': createdAt.toIso8601String(),
      'sender': sender.toJson(),
      'reply_to': replyTo,
      'attachments': attachments,
      'thread_id': threadId,
    };
  }
}

class MessageSender {
  final String id;
  final String firstName;
  final String lastName;
  final String? profilePicture;
  final String userType;

  MessageSender({
    required this.id,
    required this.firstName,
    required this.lastName,
    this.profilePicture,
    required this.userType,
  });

  // Helper getter to get full name easily
  String get fullName => '$firstName $lastName';

  factory MessageSender.fromJson(Map<String, dynamic> json) {
    return MessageSender(
      id: json['id'] ?? '',
      firstName: json['first_name'] ?? '',
      lastName: json['last_name'] ?? '',
      profilePicture: json['profile_picture'],
      userType: json['user_type'] ?? 'USER',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'first_name': firstName,
      'last_name': lastName,
      'profile_picture': profilePicture,
      'user_type': userType,
    };
  }
}