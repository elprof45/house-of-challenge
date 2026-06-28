import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  final List<Map<String, dynamic>> notifications = [
    {
      'type': 'vote',
      'title': 'New vote on your video!',
      'description': 'DanceMaster voted for "Epic Dance Performance"',
      'avatar': 'https://i.pravatar.cc/150?img=2',
      'time': '2 minutes ago',
      'isRead': false,
    },
    {
      'type': 'follow',
      'title': 'CreativeVibe started following you',
      'description': 'Artist and content creator',
      'avatar': 'https://i.pravatar.cc/150?img=3',
      'time': '1 hour ago',
      'isRead': false,
    },
    {
      'type': 'comment',
      'title': 'New comment on your video',
      'description': '"Amazing performance! This is exactly what the challenge is about! 🔥"',
      'avatar': 'https://i.pravatar.cc/150?img=3',
      'time': '2 hours ago',
      'isRead': true,
    },
    {
      'type': 'challenge',
      'title': 'New Challenge Available',
      'description': 'Eco Art Challenge - 30k prize pool',
      'avatar': null,
      'time': '5 hours ago',
      'isRead': true,
    },
    {
      'type': 'milestone',
      'title': 'Congratulations! 🎉',
      'description': 'You reached 1.2k followers',
      'avatar': null,
      'time': '1 day ago',
      'isRead': true,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          'Notifications',
          style: GoogleFonts.poppins(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.done_all, color: Colors.black),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('All notifications marked as read')),
              );
            },
          ),
        ],
      ),
      body: ListView.builder(
        padding: EdgeInsets.symmetric(vertical: 8),
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          return _buildNotificationCard(notifications[index]);
        },
      ),
    );
  }

  Widget _buildNotificationCard(Map<String, dynamic> notification) {
    Color bgColor = notification['isRead'] ? Colors.white : Colors.blue.shade50;

    return Container(
      color: bgColor,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              children: [
                if (notification['avatar'] != null)
                  CircleAvatar(
                    radius: 24,
                    backgroundImage: NetworkImage(notification['avatar']),
                  )
                else
                  Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                        colors: [Colors.blue.shade400, Colors.purple.shade400],
                      ),
                    ),
                    child: Center(
                      child: Icon(
                        _getNotificationIcon(notification['type']),
                        color: Colors.white,
                        size: 24,
                      ),
                    ),
                  ),
                SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              notification['title'],
                              style: GoogleFonts.poppins(
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                              ),
                            ),
                          ),
                          if (!notification['isRead'])
                            Container(
                              width: 8,
                              height: 8,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.blue,
                              ),
                            ),
                        ],
                      ),
                      SizedBox(height: 4),
                      Text(
                        notification['description'],
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.poppins(
                          fontSize: 11,
                          color: Colors.grey[600],
                          height: 1.3,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        notification['time'],
                        style: GoogleFonts.poppins(
                          fontSize: 10,
                          color: Colors.grey[500],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 8),
                InkWell(
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Dismissed')),
                    );
                  },
                  child: Icon(Icons.close, size: 18, color: Colors.grey),
                ),
              ],
            ),
          ),
          Divider(height: 1, indent: 60),
        ],
      ),
    );
  }

  IconData _getNotificationIcon(String type) {
    switch (type) {
      case 'vote':
        return Icons.how_to_vote;
      case 'follow':
        return Icons.person_add;
      case 'comment':
        return Icons.comment;
      case 'challenge':
        return Icons.emoji_events;
      case 'milestone':
        return Icons.star;
      default:
        return Icons.notifications;
    }
  }
}
