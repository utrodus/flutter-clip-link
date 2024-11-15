// ignore_for_file: lines_longer_than_80_chars

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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 12),
                  Text(
                    'ClipLink App use spoo.me API provider'
                    ' for generating short url ',
                    style: context.textTheme.bodyMedium,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'The spoo.me API enforces a rate limit to prevent '
                    'excessive usage and ensure fair access for all users.',
                    style: context.textTheme.bodyMedium,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'The rate limits are designed to control the frequency '
                    'with which clients can send requests.',
                    style: context.textTheme.bodyMedium,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'Here’s how the rate limit works in detail',
                    style: context.textTheme.bodyMedium,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    '1. Per Minute Limit: You can make up to 5 requests per minute ',
                    style: context.textTheme.bodyMedium?.copyWith(
                      fontWeight: bold,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    '2. Per Hour Limit: You can make a maximum of 50 requests per hour',
                    style: context.textTheme.bodyMedium?.copyWith(
                      fontWeight: bold,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    '3. Per Day Limit: You can make a maximum of 500 requests per day',
                    style: context.textTheme.bodyMedium?.copyWith(
                      fontWeight: bold,
                    ),
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
