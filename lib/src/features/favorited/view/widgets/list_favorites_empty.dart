import 'package:flutter/material.dart';
import 'package:flutter_clip_link/src/core/core.dart';
import 'package:flutter_clip_link/src/routes/routes.dart';

class ListFavoritesEmpty extends StatelessWidget {
  const ListFavoritesEmpty({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          const SizedBox(
            height: 91.26,
          ),
          Assets.images.favoritesEmptyLight.image(),
          const SizedBox(
            height: 30,
          ),
          Text(
            'Simplify your life by saving your',
            style: context.textTheme.titleSmall,
          ),
          Text(
            'shortened links to your favorite collection',
            style: context.textTheme.titleSmall,
          ),
          const SizedBox(
            height: 24,
          ),
          CLButton(
            text: 'Add link now',
            minimumSize: const Size(130, 40),
            onPressed: () {
              Routes.listShorten.go(context);
            },
          ),
        ],
      ),
    );
  }
}
