# House of Challenge - Modern Social Video Challenge Platform

A comprehensive Flutter application for social video challenges with voting, ranking, profiles, and community engagement features.

## 🎯 Features

### Core Features
- **User Authentication**: Login/Signup with email and social OAuth
- **Video Discovery & Browsing**: Featured challenges, category filtering, trending content
- **Video Voting System**: Vote for videos with real-time engagement metrics
- **User Profiles**: Profile pages with stats, badges, followers, activity history
- **Challenges**: Browse and join challenges with prize pools and rules
- **Leaderboard**: Competitive ranking system with badges and achievements
- **Comments & Engagement**: Comment on videos, like content, vote for creators
- **Activity Tracking**: Complete history of user actions and achievements
- **Notifications**: Real-time notifications for follows, votes, comments
- **Search**: Discover videos, users, and challenges with trending hashtags

### Social Features
- Follow/unfollow users
- Like and vote on videos
- Comment on videos with nested replies
- Share videos
- View user profiles and follower lists
- Badge and achievement system
- Points system for engagement

### UI/UX Features
- Modern Material 3 design
- Smooth animations and transitions
- Pull-to-refresh functionality
- Responsive layouts
- Dark-mode ready architecture
- Professional gradients and shadows
- Emoji-based engagement metrics
- State management for interactive elements

## 📁 Project Structure

```
lib/
├── main.dart                          # App entry point with routing
├── models/                            # Data models
│   ├── user_model.dart               # User profile, stats, social
│   ├── video_model.dart              # Video content with engagement
│   ├── challenge_model.dart          # Challenge/event data
│   └── comment_model.dart            # Comments and replies
├── services/                          # Services and utilities
│   └── mock_data.dart                # Mock data for development
└── screens/                           # UI screens
    ├── auth_screen.dart              # Login/Signup (NEW)
    ├── main_navigation.dart          # Bottom navigation (UPDATED)
    ├── home_screen.dart              # Video feed (MODERNIZED)
    ├── vote_screen.dart              # Voting interface (MODERNIZED)
    ├── event_screen.dart             # Challenge browser (MODERNIZED)
    ├── rank_screen.dart              # Leaderboard (MODERNIZED)
    ├── history_screen.dart           # Activity timeline (MODERNIZED)
    ├── profile_screen.dart           # User profiles (NEW)
    ├── video_detail_screen.dart      # Video viewer with comments (NEW)
    ├── search_screen.dart            # Search with trends (NEW)
    ├── notification_screen.dart      # Notifications (NEW)
    └── onboarding_screen.dart        # Onboarding (legacy)
```

## 🎨 Design System

### Color Palette
- **Primary**: `Colors.blue` (#2196F3)
- **Secondary**: `Colors.purple` (#9C27B0)
- **Success**: `Colors.green` (#4CAF50)
- **Warning**: `Colors.orange` (#FF9800)
- **Error**: `Colors.red` (#F44336)

### Typography
- Font Family: **Poppins** (via google_fonts)
- Sizes: 11px (small), 12px (body), 14px (subtitle), 16px (title), 20-24px (headings)
- Weights: Regular (400), SemiBold (600), Bold (700)

### Components
- Rounded corners: 12px (buttons), 16px (cards), 20px (badges)
- Shadow elevation: 4-12px
- Border width: 1px (subtle borders)
- Spacing: 8px, 12px, 16px, 20px (multiples of 4)

## 🚀 Getting Started

### Prerequisites
- Flutter SDK ^3.11.1
- Dart ^3.11.1

### Installation
```bash
# Clone the repository
git clone <repo_url>
cd house_of_challenge

# Install dependencies
flutter pub get

# Run the app
flutter run
```

## 📦 Dependencies

### Core
- **flutter**: UI framework
- **get**: State management and routing
- **google_fonts**: Typography

### Existing
- **lottie**: Animations
- **cupertino_icons**: iOS icons
- **http**: API calls
- **permission_handler**: Device permissions
- **google_fonts**: Typography

### Available for Enhancement
- **video_player**: Video playback
- **image_picker**: Image/video uploads
- **firebase**: Backend and auth
- **sqflite**: Local database
- **riverpod**: Advanced state management

## 🎬 Key Screens

### Authentication
- Phone-friendly auth with email/password
- Social login options (Google, Facebook, Apple)
- Form validation
- Password visibility toggle

### Home Feed
- Featured challenge cards
- Category filters
- Video cards with creator info
- Engagement stats (views, likes, votes, comments)
- Interactive voting and liking

### Video Detail
- Full video preview
- Creator profile with follow button
- Comment section with add comment
- Detailed engagement metrics
- Share functionality

### Voting Interface
- Ranked video leaderboard
- Voting with state feedback
- Video previews with stats
- Quick watch/comment buttons
- Filter by trending/recent/popular

### Leaderboard
- Top 3 podium display
- Complete user rankings
- Stats display (followers, challenges, points)
- Period filters (daily/weekly/monthly)
- Tap to view full profiles

### User Profiles
- Profile header with stats
- Follow button for other users
- Tabbed interface (Videos, Challenges, Activity)
- Badge display
- Follower/following lists

### Search
- Real-time search across videos, users, challenges
- Recent searches history
- Trending hashtags
- Creator discovery
- Horizontal creator cards

### Notifications
- Multiple notification types
- Unread indicators
- Timestamps
- Dismiss functionality
- User avatars

## 🔄 State Management

Currently using **setState** for simplicity. For production, consider:
- **GetX**: For reactive programming
- **Riverpod**: For functional approach
- **BLoC**: For complex state management

## 🔗 API Integration (Future)

The app is ready for API integration:
1. Replace `MockData` with actual API calls
2. Use `http` package for REST API
3. Implement JWT authentication
4. Add error handling and retry logic
5. Implement pagination for feeds

## 📱 Video & Media (Future)

Add video playback support:
```bash
flutter pub add video_player
flutter pub add chewie  # For better UI controls
flutter pub add image_picker  # For uploads
```

## 🔐 Authentication (Future)

Integrate Firebase:
```bash
flutter pub add firebase_core
flutter pub add firebase_auth
flutter pub add firebase_storage
```

## 📊 Analytics (Future)

Track user engagement:
```bash
flutter pub add firebase_analytics
flutter pub add mixpanel_flutter
```

## 🎯 Performance Optimizations

- Implement image caching
- Use `const` constructors where possible
- Lazy load lists with `ListView.builder`
- Implement video thumbnail caching
- Use `RepaintBoundary` for expensive widgets

## 🐛 Known Issues & Todos

- [ ] Video player implementation
- [ ] Real-time vote syncing
- [ ] Push notifications
- [ ] Offline support
- [ ] Dark mode support
- [ ] Video upload feature
- [ ] Profile editing
- [ ] Privacy settings
- [ ] Report/block users
- [ ] Analytics dashboard

## 📝 Customization Guide

### Change Brand Colors
Edit `theme` in `main.dart`:
```dart
colorScheme: ColorScheme.fromSeed(seedColor: YOUR_COLOR),
```

### Add New Features
1. Create model in `lib/models/`
2. Create service/utilities in `lib/services/`
3. Create screen in `lib/screens/`
4. Update `main_navigation.dart` for navigation

### Modify Layouts
Each screen is self-contained - modify padding, spacing, and colors in individual files.

## 🤝 Contributing

1. Create a feature branch
2. Make your changes
3. Test thoroughly
4. Submit a pull request

## 📄 License

This project is licensed under the MIT License.

## 📞 Support

For questions or issues, please open an issue on the repository.

---

**Last Updated**: March 11, 2026
**App Version**: 1.0.0
**Flutter Version**: ^3.11.1
