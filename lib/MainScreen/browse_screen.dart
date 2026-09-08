import 'package:flutter/material.dart';
import 'app_drawer.dart';

// TEMPORARY mock data — replace with GET /api/posts once the REST API
// is connected.
class _BrowsePost {
  final String name;
  final String postedAgo;
  final String offers;
  final String wants;
  final String description;
  final int likes;
  final int comments;

  const _BrowsePost({
    required this.name,
    required this.postedAgo,
    required this.offers,
    required this.wants,
    required this.description,
    required this.likes,
    required this.comments,
  });
}

const List<_BrowsePost> _mockPosts = [
  _BrowsePost(
    name: 'Priya N.',
    postedAgo: '2 hours ago',
    offers: 'Conversational Spanish',
    wants: 'Intro to Python',
    description:
        "Weekly 30-minute chats. I'll help you improve your Spanish while you teach me Python.",
    likes: 12,
    comments: 4,
  ),
  _BrowsePost(
    name: 'John Doe',
    postedAgo: '5 hours ago',
    offers: 'Photoshop',
    wants: 'React',
    description:
        'Happy to help with photo editing basics in exchange for React fundamentals.',
    likes: 8,
    comments: 2,
  ),
];

class BrowseScreen extends StatelessWidget {
  const BrowseScreen({super.key});

  void _handlePropose(BuildContext context, String name) {
    // TEMPORARY — replace with POST /api/exchanges once connected.
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Exchange proposed to $name (not yet connected to API)')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: learnLoopAppBar('Browse', context: context),
      drawer: const AppDrawer(),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: _mockPosts.length,
        itemBuilder: (context, index) {
          final post = _mockPosts[index];
          return Card(
            margin: const EdgeInsets.only(bottom: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            elevation: 2,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const CircleAvatar(
                        backgroundColor: Colors.orange,
                        child: Icon(Icons.person, color: Colors.white),
                      ),
                      const SizedBox(width: 12),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            post.name,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            post.postedAgo,
                            style: const TextStyle(
                                color: Colors.grey, fontSize: 12),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  RichText(
                    text: TextSpan(
                      style: DefaultTextStyle.of(context).style,
                      children: [
                        const TextSpan(
                          text: 'Offers: ',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        TextSpan(text: post.offers),
                      ],
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                      style: DefaultTextStyle.of(context).style,
                      children: [
                        const TextSpan(
                          text: 'Wants: ',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        TextSpan(text: post.wants),
                      ],
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(post.description),
                  const SizedBox(height: 12),
                  const Divider(),
                  Row(
                    children: [
                      const Icon(Icons.thumb_up_alt_outlined,
                          size: 18, color: Colors.orange),
                      const SizedBox(width: 6),
                      Text('${post.likes} Likes'),
                      const Spacer(),
                      const Icon(Icons.mode_comment_outlined,
                          size: 18, color: Colors.purple),
                      const SizedBox(width: 6),
                      Text('${post.comments} Comments'),
                    ],
                  ),
                  const SizedBox(height: 12),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () => _handlePropose(context, post.name),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                      ),
                      child: const Text('Propose Exchange'),
                    ),
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
