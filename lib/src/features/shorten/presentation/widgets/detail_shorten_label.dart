import 'package:flutter/material.dart';
import 'package:flutter_clip_link/src/core/core.dart';

class DetailShortenLabel extends StatelessWidget {
  const DetailShortenLabel({required this.text, super.key});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 12,
        horizontal: 16,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            text,
            style: context.textTheme.labelLarge?.copyWith(
              color: context.colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }
}
