import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clip_link/src/core/core.dart';
import 'package:flutter_clip_link/src/features/shorten/presentation/cubit/list_shorten_cubit.dart';
import 'package:flutter_clip_link/src/features/shorten/presentation/widgets/shorten_url_item.dart';
import 'package:flutter_clip_link/src/routes/routes.dart';
import 'package:go_router/go_router.dart';
import 'package:skeletonizer/skeletonizer.dart';

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
              const SizedBox(
                height: 16,
              ),

              BlocBuilder<ListShortenCubit, ListShortenState>(
                builder: (context, state) {
                  final isLoading = state is ListShortenLoading;
                  final isLoaded = state is ListShortenLoaded;
                  return Skeletonizer(
                    enabled: isLoading,
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: isLoading
                          ? 6
                          : isLoaded
                              ? state.shortenItems.length
                              : 0,
                      itemBuilder: (ctx, index) {
                        return ShortenUrlItem(
                          shortUrl: 'https://spoo.me/people-work',
                          originalUrl: 'https://www.freepik.com/free-psd/...',
                          isFavorited: true,
                          onTapItem: () {
                            debugPrint('tapped item');
                            GoRouter.of(context).go(
                              '${Routes.listShorten.path}/${Routes.detailShortenURL.path}',
                            );
                          },
                          onTapFavorite: () {
                            debugPrint('coba');
                          },
                        );
                      },
                    ),
                  );
                },
              ),

              // const ListShortenEmpty(),
            ],
          ),
        ),
      ),
    );
  }
}
