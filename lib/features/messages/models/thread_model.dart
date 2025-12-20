class ThreadModel {
  final String id;
  final String type;
  final String? title;
  final String? description;
  final bool isActive;
  final DateTime createdAt;
  final DateTime updatedAt;
  final List<Participant> participants;
  final List<Message> messages;
  final int unreadCount;
  final LastMessage? lastMessage;

  ThreadModel({
    required this.id,
    required this.type,
    this.title,
    this.description,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
    required this.participants,
    required this.messages,
    required this.unreadCount,
    this.lastMessage,
  });

  factory ThreadModel.fromJson(Map<String, dynamic> json) {
    return ThreadModel(
      id: json['id'] ?? '',
      type: json['type'] ?? 'DIRECT',
      title: json['title'],
      description: json['description'],
      isActive: json['is_active'] ?? true,
      createdAt: DateTime.parse(json['created_at'] ?? DateTime.now().toIso8601String()),
      updatedAt: DateTime.parse(json['updated_at'] ?? DateTime.now().toIso8601String()),
      participants: (json['participants'] as List?)
          ?.map((p) => Participant.fromJson(p))
          .toList() ?? [],
      messages: (json['messages'] as List?)
          ?.map((m) => Message.fromJson(m))
          .toList() ?? [],
      unreadCount: json['unreadCount'] ?? 0,
      lastMessage: json['lastMessage'] != null
          ? LastMessage.fromJson(json['lastMessage'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'type': type,
      'title': title,
      'description': description,
      'is_active': isActive,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
      'participants': participants.map((p) => p.toJson()).toList(),
      'messages': messages.map((m) => m.toJson()).toList(),
      'unreadCount': unreadCount,
      'lastMessage': lastMessage?.toJson(),
    };
  }
}

// --- Sub-Models for Internal Parsing ---

class Participant {
  final String id;
  final String name;
  final String? avatar;

  Participant({required this.id, required this.name, this.avatar});

  factory Participant.fromJson(Map<String, dynamic> json) {
    final user = json['user'] ?? {};
    return Participant(
      id: user['id'] ?? '',
      name: user['name'] ?? '',
      avatar: user['avatar'],
    );
  }

  Map<String, dynamic> toJson() => {
    'user': {'id': id, 'name': name, 'avatar': avatar}
  };
}

class Message {
  final String content;
  final DateTime sentAt;
  final String messageType;
  final Sender sender;

  Message({
    required this.content,
    required this.sentAt,
    required this.messageType,
    required this.sender,
  });

  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(
      content: json['content'] ?? '',
      sentAt: DateTime.parse(json['sent_at'] ?? DateTime.now().toIso8601String()),
      messageType: json['message_type'] ?? 'TEXT',
      sender: Sender.fromJson(json['sender'] ?? {}),
    );
  }

  Map<String, dynamic> toJson() => {
    'content': content,
    'sent_at': sentAt.toIso8601String(),
    'message_type': messageType,
    'sender': sender.toJson(),
  };
}

class Sender {
  final String id;
  final String firstName;
  final String lastName;
  final String? profilePicture;

  Sender({
    required this.id,
    required this.firstName,
    required this.lastName,
    this.profilePicture
  });

  factory Sender.fromJson(Map<String, dynamic> json) {
    return Sender(
      id: json['id'] ?? '',
      firstName: json['first_name'] ?? '',
      lastName: json['last_name'] ?? '',
      profilePicture: json['profile_picture'],
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'first_name': firstName,
    'last_name': lastName,
    'profile_picture': profilePicture,
  };
}

class LastMessage {
  final String content;
  final DateTime createdAt;
  final Participant sender; // Reusing Participant logic since the structure matches

  LastMessage({required this.content, required this.createdAt, required this.sender});

  factory LastMessage.fromJson(Map<String, dynamic> json) {
    return LastMessage(
      content: json['content'] ?? '',
      createdAt: DateTime.parse(json['createdAt'] ?? DateTime.now().toIso8601String()),
      sender: Participant.fromJson({'user': json['sender']}), // Adapting nested sender to Participant format
    );
  }

  Map<String, dynamic> toJson() => {
    'content': content,
    'createdAt': createdAt.toIso8601String(),
    'sender': sender.toJson()['user'],
  };
}