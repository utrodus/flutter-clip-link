import 'package:flutter/material.dart';
import 'package:flutter_clip_link/src/core/core.dart';

class DetailShortenGeneralStats extends StatelessWidget {
  const DetailShortenGeneralStats({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 12,
        horizontal: 16,
      ),
      color: context.colorScheme.surfaceContainerLowest,
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          GeneralStatsTile(
            label: 'Total Clicks',
            value: '0',
          ),
          GeneralStatsTile(
            label: 'Creation Date:',
            value: '2024-10-12',
          ),
          GeneralStatsTile(
            label: 'Last Click Date:',
            value: '2024-10-12',
          ),
          GeneralStatsTile(
            label: 'Last Click Browser:',
            value: 'Chrome',
          ),
          GeneralStatsTile(
            label: 'Last Click OS:',
            value: 'Windows',
          ),
          GeneralStatsTile(
            label: 'Average Redirection Time:',
            value: '20.49 ms',
          ),
        ],
      ),
    );
  }
}

class GeneralStatsTile extends StatelessWidget {
  const GeneralStatsTile({
    required this.label,
    required this.value,
    super.key,
  });

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: <Widget>[
          Text(
            label,
            style: context.textTheme.labelMedium?.copyWith(
              color: context.colorScheme.primary,
            ),
          ),
          const SizedBox(
            width: 8,
          ),
          Chip(
            padding: EdgeInsets.zero,
            labelPadding: const EdgeInsets.symmetric(
              vertical: 0,
              horizontal: 12,
            ),
            visualDensity: VisualDensity.compact,
            color: WidgetStatePropertyAll(
              context.colorScheme.primaryContainer,
            ),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(12),
              ),
            ),
            label: Text(
              value,
              style: context.textTheme.labelLarge?.copyWith(
                color: context.colorScheme.primary,
                fontWeight: bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
