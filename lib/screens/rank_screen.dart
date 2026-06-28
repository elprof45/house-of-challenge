import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:house_of_challenge/models/user_model.dart';
import 'package:house_of_challenge/services/mock_data.dart';
import 'package:house_of_challenge/screens/profile_screen.dart';

class RankScreen extends StatefulWidget {
  const RankScreen({super.key});

  @override
  State<RankScreen> createState() => _RankScreenState();
}

class _RankScreenState extends State<RankScreen> {
  late List<User> rankings;
  String _period = 'weekly';

  @override
  void initState() {
    super.initState();
    rankings = [
      MockData.sampleUsers[2], // FitnessChamp - 9500
      MockData.sampleUsers[0], // DanceMaster - 8900
      MockData.sampleUsers[1], // CreativeVibe - 7200
      ...List.generate(
        7,
        (index) => MockData.currentUser.copyWith(points: 6000 - (index * 100)),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          'Leaderboard',
          style: GoogleFonts.poppins(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
      body: CustomScrollView(
        slivers: [
          // Top 3 Podium
          SliverToBoxAdapter(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Colors.blue.shade600, Colors.purple.shade600],
                ),
              ),
              child: Column(
                children: [
                  Text(
                    'Weekly Rankings',
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      // 2nd Place
                      _buildPodiumPlace(
                        rank: 2,
                        user: rankings[1],
                        height: 120,
                        isWinner: false,
                      ),
                      SizedBox(width: 16),
                      // 1st Place
                      _buildPodiumPlace(
                        rank: 1,
                        user: rankings[0],
                        height: 160,
                        isWinner: true,
                      ),
                      SizedBox(width: 16),
                      // 3rd Place
                      _buildPodiumPlace(
                        rank: 3,
                        user: rankings[2],
                        height: 100,
                        isWinner: false,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          // Period Filter
          SliverToBoxAdapter(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                children: [
                  _buildPeriodChip('Daily', 'daily'),
                  _buildPeriodChip('Weekly', 'weekly'),
                  _buildPeriodChip('Monthly', 'monthly'),
                  _buildPeriodChip('All Time', 'all_time'),
                ],
              ),
            ),
          ),

          // Leaderboard List
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                if (index >= rankings.length) return null;
                return _buildRankingCard(rankings[index], index);
              },
            ),
          ),
          SliverToBoxAdapter(child: SizedBox(height: 20)),
        ],
      ),
    );
  }

  Widget _buildPeriodChip(String label, String value) {
    bool isSelected = _period == value;
    return Padding(
      padding: EdgeInsets.only(right: 8),
      child: FilterChip(
        label: Text(
          label,
          style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
        ),
        selected: isSelected,
        onSelected: (selected) {
          setState(() => _period = value);
        },
        backgroundColor: Colors.grey.shade200,
        selectedColor: Colors.blue,
        labelStyle: TextStyle(
          color: isSelected ? Colors.white : Colors.black,
        ),
      ),
    );
  }

  Widget _buildPodiumPlace({
    required int rank,
    required User user,
    required double height,
    required bool isWinner,
  }) {
    Color medalColor = rank == 1
        ? Colors.amber
        : rank == 2
            ? Colors.grey.shade400
            : Colors.orange.shade700;

    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(2),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: medalColor,
            boxShadow: [
              BoxShadow(
                color: medalColor.withOpacity(0.4),
                blurRadius: 12,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: CircleAvatar(
            radius: 35,
            backgroundImage: NetworkImage(user.profilePicture),
          ),
        ),
        SizedBox(height: 12),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.2),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            '🥇 #$rank',
            style: GoogleFonts.poppins(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        SizedBox(height: 8),
        Text(
          user.username,
          style: GoogleFonts.poppins(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          textAlign: TextAlign.center,
        ),
        Text(
          '${user.points} pts',
          style: GoogleFonts.poppins(
            fontSize: 11,
            color: Colors.white70,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }

  Widget _buildRankingCard(User user, int index) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => ProfileScreen(user: user),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey.shade200),
        ),
        child: Row(
          children: [
            // Rank
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.blue.shade50,
              ),
              child: Center(
                child: Text(
                  '${index + 1}',
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
              ),
            ),
            SizedBox(width: 12),

            // User Info
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          user.username,
                          style: GoogleFonts.poppins(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      if (user.isVerified)
                        Icon(Icons.verified, color: Colors.blue, size: 16),
                    ],
                  ),
                  SizedBox(height: 4),
                  Text(
                    '${user.challengesCompleted} challenges • ${user.followers} followers',
                    style: GoogleFonts.poppins(
                      fontSize: 11,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ),

            // Points
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  '${user.points}',
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
                Text(
                  'points',
                  style: GoogleFonts.poppins(
                    fontSize: 10,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
