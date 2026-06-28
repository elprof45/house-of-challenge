import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  final List<Map<String, dynamic>> activities = [
    {
      'type': 'vote',
      'title': 'Voted for Epic Dance Performance',
      'description': 'Dance Revolution 2024',
      'icon': Icons.how_to_vote,
      'color': Colors.blue,
      'time': '2 hours ago',
      'points': '+10 pts',
    },
    {
      'type': 'like',
      'title': 'Liked Creative Art Sculpture',
      'description': 'Eco Art Challenge',
      'icon': Icons.favorite,
      'color': Colors.red,
      'time': '4 hours ago',
      'points': '+5 pts',
    },
    {
      'type': 'follow',
      'title': 'Started following DanceMaster',
      'description': 'Professional dancer',
      'icon': Icons.person_add,
      'color': Colors.green,
      'time': '1 day ago',
      'points': '+0 pts',
    },
    {
      'type': 'submit',
      'title': 'Submitted video to challenge',
      'description': 'Dance Revolution 2024',
      'icon': Icons.upload_file,
      'color': Colors.orange,
      'time': '2 days ago',
      'points': '+50 pts',
    },
    {
      'type': 'comment',
      'title': 'Posted a comment',
      'description': 'On "Epic Dance Performance"',
      'icon': Icons.comment,
      'color': Colors.purple,
      'time': '3 days ago',
      'points': '+5 pts',
    },
    {
      'type': 'milestone',
      'title': 'Reached 1,000 followers',
      'description': 'Achievement unlocked!',
      'icon': Icons.emoji_events,
      'color': Colors.amber,
      'time': '5 days ago',
      'points': '+100 pts',
    },
    {
      'type': 'badge',
      'title': 'Earned "Creator" badge',
      'description': 'Submitted 5 successful videos',
      'icon': Icons.stars,
      'color': Colors.indigo,
      'time': '1 week ago',
      'points': '+50 pts',
    },
    {
      'type': 'vote',
      'title': 'Voted for Intense Workout Challenge',
      'description': '30-Day Fitness Revolution',
      'icon': Icons.how_to_vote,
      'color': Colors.blue,
      'time': '1 week ago',
      'points': '+10 pts',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          'My Activity',
          style: GoogleFonts.poppins(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.filter_list, color: Colors.black),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Filter filters coming soon!')),
              );
            },
          ),
        ],
      ),
      body: CustomScrollView(
        slivers: [
          // Summary Card
          SliverToBoxAdapter(
            child: Container(
              margin: EdgeInsets.all(16),
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Colors.blue.shade600, Colors.purple.shade600],
                ),
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.blue.withOpacity(0.3),
                    blurRadius: 12,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildSummaryItem('📊', '235', 'Points'),
                  _buildSummaryItem('🎯', '12', 'Challenges'),
                  _buildSummaryItem('🗳️', '48', 'Votes'),
                  _buildSummaryItem('⭐', '5', 'Badges'),
                ],
              ),
            ),
          ),

          // Recent Activity
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Text(
                'Recent Activity',
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),

          // Activity List
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                final activity = activities[index];
                return _buildActivityCard(activity);
              },
              childCount: activities.length,
            ),
          ),

          SliverToBoxAdapter(child: SizedBox(height: 20)),
        ],
      ),
    );
  }

  Widget _buildSummaryItem(String emoji, String value, String label) {
    return Column(
      children: [
        Text(emoji, style: TextStyle(fontSize: 20)),
        SizedBox(height: 8),
        Text(
          value,
          style: GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        SizedBox(height: 4),
        Text(
          label,
          style: GoogleFonts.poppins(
            fontSize: 11,
            color: Colors.white70,
          ),
        ),
      ],
    );
  }

  Widget _buildActivityCard(Map<String, dynamic> activity) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Row(
        children: [
          // Icon
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: activity['color'].withOpacity(0.1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(
              activity['icon'],
              color: activity['color'],
              size: 20,
            ),
          ),
          SizedBox(width: 12),

          // Activity Details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  activity['title'],
                  style: GoogleFonts.poppins(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  activity['description'],
                  style: GoogleFonts.poppins(
                    fontSize: 11,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ),

          // Time & Points
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                decoration: BoxDecoration(
                  color: activity['color'].withOpacity(0.1),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  activity['points'],
                  style: GoogleFonts.poppins(
                    fontSize: 10,
                    fontWeight: FontWeight.w600,
                    color: activity['color'],
                  ),
                ),
              ),
              SizedBox(height: 4),
              Text(
                activity['time'],
                style: GoogleFonts.poppins(
                  fontSize: 10,
                  color: Colors.grey[500],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
