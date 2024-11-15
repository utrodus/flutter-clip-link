import 'package:flutter/material.dart';
import 'package:flutter_clip_link/src/core/core.dart';

class ApiRateLimitPage extends StatelessWidget {
  const ApiRateLimitPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('API Rate Limit'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Align(
          alignment: Alignment.topCenter,
          child: ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: 600,
            ),
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(
                vertical: 14,
                horizontal: 16,
              ),
              child: Column(
                children: [
                  const SizedBox(height: 12),
                  Text(
                    '''
 The Spoo.me API enforces a rate limit to prevent excessive usage and ensure fair access for all users. The rate limits are designed to control the frequency with which clients can send requests, specifically to the POST / and POST /emoji endpoints. Here’s how the rate limit works in detail:
 ''',
                    style: context.textTheme.bodyMedium,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
