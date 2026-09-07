import 'package:flutter/material.dart';
import 'app_drawer.dart';

// TEMPORARY mock data — replace with GET /api/exchange-requests once
// connected.
class _ExchangeRequest {
  final String name;
  final String wantsToLearn;
  final String offers;

  const _ExchangeRequest({
    required this.name,
    required this.wantsToLearn,
    required this.offers,
  });
}

class ExchangeScreen extends StatefulWidget {
  const ExchangeScreen({super.key});

  @override
  State<ExchangeScreen> createState() => _ExchangeScreenState();
}

class _ExchangeScreenState extends State<ExchangeScreen> {
  final List<_ExchangeRequest> _requests = const [
    _ExchangeRequest(name: 'John Doe', wantsToLearn: 'React', offers: 'Photoshop'),
    _ExchangeRequest(name: 'Maria Cruz', wantsToLearn: 'English', offers: 'Graphic Design'),
  ].toList();

  // TEMPORARY handlers — replace with POST /api/exchange-requests/:id/accept
  // and /decline once the REST API is connected.
  void _handleAccept(_ExchangeRequest request) {
    setState(() => _requests.remove(request));
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Accepted ${request.name} (not yet connected to API)')),
    );
  }

  void _handleDecline(_ExchangeRequest request) {
    setState(() => _requests.remove(request));
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Declined ${request.name} (not yet connected to API)')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: learnLoopAppBar('Exchanges'),
      drawer: const AppDrawer(),
      body: _requests.isEmpty
          ? const Center(child: Text('No pending exchange requests'))
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: _requests.length,
              itemBuilder: (context, index) {
                final request = _requests[index];
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
                        Text(
                          request.name,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        const SizedBox(height: 4),
                        Text('Wants to learn: ${request.wantsToLearn}',
                            style: const TextStyle(color: Colors.grey)),
                        Text('Offers: ${request.offers}',
                            style: const TextStyle(color: Colors.grey)),
                        const SizedBox(height: 12),
                        Row(
                          children: [
                            ElevatedButton(
                              onPressed: () => _handleAccept(request),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.orange,
                                foregroundColor: Colors.white,
                              ),
                              child: const Text('Accept'),
                            ),
                            const SizedBox(width: 8),
                            OutlinedButton(
                              onPressed: () => _handleDecline(request),
                              style: OutlinedButton.styleFrom(
                                foregroundColor: Colors.black,
                              ),
                              child: const Text('Decline'),
                            ),
                          ],
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
