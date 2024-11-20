import 'package:flutter/material.dart';
import 'package:flutter_clip_link/src/features/shorten/shorten.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ListShortenLoading extends StatelessWidget {
  const ListShortenLoading({super.key});

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
            shortUrl: 'https://spoo.me/people-work',
            originalUrl: 'https://www.freepik.com/free-psd/...',
            isFavorited: true,
            onTapItem: () {},
            onTapFavorite: () {},
          );
        },
      ),
    );
  }
}
