import 'package:flutter/material.dart';
import 'package:flutter_clip_link/src/core/core.dart';
import 'package:flutter_clip_link/src/features/shorten/shorten.dart';
import 'package:flutter_clip_link/src/routes/routes.dart';
import 'package:go_router/go_router.dart';

class ListShortenUrlPage extends StatelessWidget {
  const ListShortenUrlPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Assets.images.logo.image(
              height: 32,
              width: 32,
            ),
            const SizedBox(
              width: 13.5,
            ),
            Text(
              'ClipLink',
              style: context.textTheme.titleLarge?.copyWith(
                color: context.colorScheme.onPrimaryContainer,
                fontWeight: bold,
              ),
            ),
          ],
        ),
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
      floatingActionButton: FloatingActionButton(
        child: const Icon(
          Icons.add,
        ),
        onPressed: () {
          GoRouter.of(context)
              .go('${Routes.listShorten.path}/${Routes.addNewShortenURL.path}');
          // Routes.addNewShortenURL.push(context);
        },
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(
            top: 0,
            left: 20,
            right: 20,
            bottom: 24,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hi Utrodus Said, Welcome!',
                style: context.textTheme.labelLarge,
              ),
              const ListShortenEmpty(),
            ],
          ),
        ),
      ),
    );
  }
}
