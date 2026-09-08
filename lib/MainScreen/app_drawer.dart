import 'package:flutter/material.dart';
import 'browse_screen.dart';
import 'matches_screen.dart';
import 'exchange_screen.dart';
import 'messages_screen.dart';
import 'profile_screen.dart';

// TEMPORARY profile header data — replace with real user data
// once the REST API (e.g. GET /api/profile) is connected.
class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  void _navigateTo(BuildContext context, Widget screen) {
    Navigator.pop(context); // close drawer first
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => screen),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            color: Colors.orange,
            padding: const EdgeInsets.fromLTRB(20, 60, 20, 24),
            child: const Row(
              children: [
                CircleAvatar(
                  radius: 28,
                  backgroundColor: Colors.white,
                  child: Icon(Icons.person, size: 32, color: Colors.blue),
                ),
                SizedBox(width: 14),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Profile Name',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    Text('Skills', style: TextStyle(color: Colors.black87)),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          ListTile(
            leading: const Icon(Icons.home_outlined),
            title: const Text('Browse'),
            onTap: () => _navigateTo(context, const BrowseScreen()),
          ),
          ListTile(
            leading: const Icon(Icons.people_alt_outlined),
            title: const Text('Matches'),
            onTap: () => _navigateTo(context, const MatchesScreen()),
          ),
          ListTile(
            leading: const Icon(Icons.sync_alt),
            title: const Text('Exchange'),
            onTap: () => _navigateTo(context, const ExchangeScreen()),
          ),
          ListTile(
            leading: const Icon(Icons.chat_bubble_outline),
            title: const Text('Messages'),
            onTap: () => _navigateTo(context, const MessagesScreen()),
          ),
          ListTile(
            leading: const Icon(Icons.person_outline),
            title: const Text('Profile'),
            onTap: () => _navigateTo(context, const ProfileScreen()),
          ),
          const Spacer(),
          const Divider(height: 1),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Logout'),
            onTap: () {
              // TEMPORARY — replace with real logout (clear token, navigate
              // to LoginScreen) once auth is connected.
              Navigator.pop(context);
            },
          ),
          const SizedBox(height: 12),
        ],
      ),
    );
  }
}

// Shared AppBar so every screen matches the orange header in the mockups.
// Pass a BuildContext so the bell icon can show a snackbar/navigate.
// hasUnread controls the small red dot (TEMPORARY — replace with a real
// unread-count check once GET /api/notifications is connected).
PreferredSizeWidget learnLoopAppBar(
    String title, {
      BuildContext? context,
      bool hasUnread = true,
    }) {
  return AppBar(
    backgroundColor: Colors.orange,
    foregroundColor: Colors.black,
    elevation: 0,
    title: Text(
      title,
      style: const TextStyle(fontWeight: FontWeight.w600),
    ),
    centerTitle: true,
    actions: [
      Stack(
        alignment: Alignment.center,
        children: [
          IconButton(
            icon: const Icon(Icons.notifications_none),
            onPressed: () {
              // TEMPORARY — replace with navigation to a real
              // NotificationsScreen once connected to the API.
              if (context != null) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Notifications tapped (not yet connected to API)'),
                  ),
                );
              }
            },
          ),
          if (hasUnread)
            Positioned(
              top: 10,
              right: 10,
              child: Container(
                width: 8,
                height: 8,
                decoration: const BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.circle,
                ),
              ),
            ),
        ],
      ),
      const SizedBox(width: 8),
    ],
  );
}