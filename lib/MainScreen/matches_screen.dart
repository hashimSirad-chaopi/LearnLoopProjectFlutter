import 'package:flutter/material.dart';
import 'app_drawer.dart';
import 'messages_screen.dart';

// TEMPORARY mock data — replace with GET /api/matches once connected.
class _Match {
  final String name;
  final String skillPair;
  final String matchedWhen;

  const _Match({
    required this.name,
    required this.skillPair,
    required this.matchedWhen,
  });
}

const List<_Match> _mockMatches = [
  _Match(name: 'John Doe', skillPair: 'React ↔ Photoshop', matchedWhen: 'Matched 2 days ago'),
  _Match(name: 'Sarah Lee', skillPair: 'English ↔ Java', matchedWhen: 'Matched Yesterday'),
];

class MatchesScreen extends StatelessWidget {
  const MatchesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: learnLoopAppBar('Matches'),
      drawer: const AppDrawer(),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: _mockMatches.length,
        itemBuilder: (context, index) {
          final match = _mockMatches[index];
          return Card(
            margin: const EdgeInsets.only(bottom: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            elevation: 2,
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Row(
                children: [
                  const CircleAvatar(
                    radius: 26,
                    backgroundColor: Colors.orange,
                    child: Icon(Icons.person, color: Colors.white),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          match.name,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(match.skillPair,
                            style: const TextStyle(color: Colors.grey)),
                        Text(
                          match.matchedWhen,
                          style: const TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const MessagesScreen(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                      foregroundColor: Colors.white,
                    ),
                    child: const Text('Message'),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
