class Challenge {
  final String id;
  final String title;
  final String description;
  final String imageUrl;
  final String category;
  final DateTime startDate;
  final DateTime endDate;
  final int totalParticipants;
  final int totalSubmissions;
  final String status;
  final int prizePool;
  final List<String> rules;

  Challenge({
    required this.id,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.category,
    required this.startDate,
    required this.endDate,
    required this.totalParticipants,
    required this.totalSubmissions,
    required this.status,
    required this.prizePool,
    required this.rules,
  });

  bool get isActive => DateTime.now().isBefore(endDate) && DateTime.now().isAfter(startDate);

  String get daysLeft {
    final difference = endDate.difference(DateTime.now()).inDays;
    return difference > 0 ? '$difference days left' : 'Ended';
  }

  factory Challenge.empty() {
    return Challenge(
      id: '',
      title: '',
      description: '',
      imageUrl: '',
      category: '',
      startDate: DateTime.now(),
      endDate: DateTime.now(),
      totalParticipants: 0,
      totalSubmissions: 0,
      status: 'upcoming',
      prizePool: 0,
      rules: [],
    );
  }
}
