import 'package:flutter/material.dart';
import 'package:flutter_clip_link/src/core/core.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ShortenUrlItemsLoading extends StatelessWidget {
  const ShortenUrlItemsLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: true,
      child: ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 6,
        itemBuilder: (ctx, index) {
          return ShortenUrlItem(
            shortUrl: 'https://spoo.me/utrd',
            originalUrl: 'https://www.utrodus.com',
            isFavorited: true,
            onTapItem: () {},
            onTapFavorite: () {},
          );
        },
      ),
    );
  }
}
