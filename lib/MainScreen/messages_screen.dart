import 'package:flutter/material.dart';
import 'app_drawer.dart';

// TEMPORARY mock data — replace with GET /api/conversations once
// connected.
class _Conversation {
  final String name;
  final String lastMessage;

  const _Conversation({required this.name, required this.lastMessage});
}

const List<_Conversation> _mockConversations = [
  _Conversation(name: 'John Doe', lastMessage: 'See you tomorrow at 7 PM!'),
  _Conversation(name: 'Sarah Lee', lastMessage: "Thanks for today's lesson."),
];

class MessagesScreen extends StatelessWidget {
  const MessagesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: learnLoopAppBar('Messages'),
      drawer: const AppDrawer(),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: _mockConversations.length,
        itemBuilder: (context, index) {
          final convo = _mockConversations[index];
          return Card(
            margin: const EdgeInsets.only(bottom: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            elevation: 2,
            child: ListTile(
              contentPadding: const EdgeInsets.all(12),
              leading: const CircleAvatar(
                radius: 26,
                backgroundColor: Colors.white,
                child: Icon(Icons.person, color: Colors.orange, size: 30),
              ),
              title: Text(
                convo.name,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(convo.lastMessage),
              onTap: () {
                // TEMPORARY — replace with navigation to a real chat
                // thread screen once messaging is connected.
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      'Opening chat with ${convo.name} (not yet connected to API)',
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
