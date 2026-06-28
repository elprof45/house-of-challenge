class User {
  final String id;
  final String username;
  final String email;
  final String profilePicture;
  final String bio;
  final int followers;
  final int following;
  final int totalVotes;
  final int challengesCompleted;
  final List<String> badges;
  final bool isVerified;
  final DateTime createdAt;
  int points;

  User({
    required this.id,
    required this.username,
    required this.email,
    required this.profilePicture,
    required this.bio,
    required this.followers,
    required this.following,
    required this.totalVotes,
    required this.challengesCompleted,
    required this.badges,
    required this.isVerified,
    required this.createdAt,
    this.points = 0,
  });

  factory User.empty() {
    return User(
      id: '',
      username: '',
      email: '',
      profilePicture: '',
      bio: '',
      followers: 0,
      following: 0,
      totalVotes: 0,
      challengesCompleted: 0,
      badges: [],
      isVerified: false,
      createdAt: DateTime.now(),
    );
  }

  User copyWith({
    String? id,
    String? username,
    String? email,
    String? profilePicture,
    String? bio,
    int? followers,
    int? following,
    int? totalVotes,
    int? challengesCompleted,
    List<String>? badges,
    bool? isVerified,
    DateTime? createdAt,
    int? points,
  }) {
    return User(
      id: id ?? this.id,
      username: username ?? this.username,
      email: email ?? this.email,
      profilePicture: profilePicture ?? this.profilePicture,
      bio: bio ?? this.bio,
      followers: followers ?? this.followers,
      following: following ?? this.following,
      totalVotes: totalVotes ?? this.totalVotes,
      challengesCompleted: challengesCompleted ?? this.challengesCompleted,
      badges: badges ?? this.badges,
      isVerified: isVerified ?? this.isVerified,
      createdAt: createdAt ?? this.createdAt,
      points: points ?? this.points,
    );
  }
}
