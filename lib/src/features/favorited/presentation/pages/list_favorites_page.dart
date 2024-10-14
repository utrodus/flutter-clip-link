import 'package:flutter/material.dart';
import 'package:flutter_clip_link/src/core/core.dart';
import 'package:flutter_clip_link/src/features/favorited/presentation/widgets/list_favorites_empty.dart';

class ListFavoritesPage extends StatelessWidget {
  const ListFavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorites'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Assets.icons.icSearch.svg(
              colorFilter: ColorFilter.mode(
                context.colorScheme.secondary,
                BlendMode.srcIn,
              ),
            ),
          ),
        ],
      ),
      body: const SafeArea(
        child: Column(
          children: <Widget>[
            ListFavoritesEmpty(),
          ],
        ),
      ),
    );
  }
}
