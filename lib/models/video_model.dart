class Video {
  final String id;
  final String title;
  final String description;
  final String videoUrl;
  final String thumbnailUrl;
  final String creatorId;
  final String creatorName;
  final String creatorAvatar;
  final String challengeTitle;
  final String category;
  final int views;
  int likes;
  int votes;
  final List<String> likedBy;
  final List<String> votedBy;
  final DateTime createdAt;
  final Duration duration;
  bool isLiked;
  bool isVoted;
  int comments;

  Video({
    required this.id,
    required this.title,
    required this.description,
    required this.videoUrl,
    required this.thumbnailUrl,
    required this.creatorId,
    required this.creatorName,
    required this.creatorAvatar,
    required this.challengeTitle,
    required this.category,
    required this.views,
    required this.likes,
    required this.votes,
    required this.likedBy,
    required this.votedBy,
    required this.createdAt,
    required this.duration,
    this.isLiked = false,
    this.isVoted = false,
    this.comments = 0,
  });

  factory Video.empty() {
    return Video(
      id: '',
      title: '',
      description: '',
      videoUrl: '',
      thumbnailUrl: '',
      creatorId: '',
      creatorName: '',
      creatorAvatar: '',
      challengeTitle: '',
      category: '',
      views: 0,
      likes: 0,
      votes: 0,
      likedBy: [],
      votedBy: [],
      createdAt: DateTime.now(),
      duration: Duration.zero,
    );
  }

  String get engagement => '${views ~/ 1000}k views • ${likes} likes • ${votes} votes';

  Video copyWith({
    String? id,
    String? title,
    String? description,
    String? videoUrl,
    String? thumbnailUrl,
    String? creatorId,
    String? creatorName,
    String? creatorAvatar,
    String? challengeTitle,
    String? category,
    int? views,
    int? likes,
    int? votes,
    List<String>? likedBy,
    List<String>? votedBy,
    DateTime? createdAt,
    Duration? duration,
    bool? isLiked,
    bool? isVoted,
    int? comments,
  }) {
    return Video(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      videoUrl: videoUrl ?? this.videoUrl,
      thumbnailUrl: thumbnailUrl ?? this.thumbnailUrl,
      creatorId: creatorId ?? this.creatorId,
      creatorName: creatorName ?? this.creatorName,
      creatorAvatar: creatorAvatar ?? this.creatorAvatar,
      challengeTitle: challengeTitle ?? this.challengeTitle,
      category: category ?? this.category,
      views: views ?? this.views,
      likes: likes ?? this.likes,
      votes: votes ?? this.votes,
      likedBy: likedBy ?? this.likedBy,
      votedBy: votedBy ?? this.votedBy,
      createdAt: createdAt ?? this.createdAt,
      duration: duration ?? this.duration,
      isLiked: isLiked ?? this.isLiked,
      isVoted: isVoted ?? this.isVoted,
      comments: comments ?? this.comments,
    );
  }
}
