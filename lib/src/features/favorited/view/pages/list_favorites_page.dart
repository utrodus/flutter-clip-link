import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clip_link/src/core/core.dart';
import 'package:flutter_clip_link/src/features/favorited/favorited.dart';
import 'package:flutter_clip_link/src/routes/routes.dart';
import 'package:go_router/go_router.dart';

class ListFavoritesPage extends StatelessWidget {
  const ListFavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorites'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: BlocBuilder<ListFavoritesBloc, ListFavoritesState>(
          builder: (context, state) {
            if (state is ListFavoritesLoading) {
              return const ShortenUrlItemsLoading();
            } else if (state is ListFavoritesSuccessLoad) {
              if (state.favoriteItems.isEmpty) {
                return const ListFavoritesEmpty();
              }
              return Align(
                alignment: Alignment.topCenter,
                child: ConstrainedBox(
                  constraints: const BoxConstraints(
                    maxWidth: Breakpoints.tablet,
                  ),
                  child: ListView.builder(
                    padding: EdgeInsets.only(
                      top: responsive.isMobile || responsive.isTablet ? 12 : 24,
                      left: 20,
                      right: 20,
                      bottom: 24,
                    ),
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: state.favoriteItems.length,
                    itemBuilder: (ctx, index) {
                      final item = state.favoriteItems[index];
                      return ShortenUrlItem(
                        shortUrl: item.shortenedUrl,
                        originalUrl: item.originalUrl,
                        isFavorited: item.isFavorited,
                        onTapItem: () {
                          item.isHavePassword
                              ? context.goNamed(
                                  Routes.inputPassword.name,
                                  pathParameters: {
                                    'shortCode': item.shortCode,
                                  },
                                )
                              : context.goNamed(
                                  Routes.detailFavorites.name,
                                  pathParameters: {
                                    'shortCode': item.shortCode,
                                  },
                                );
                        },
                        onTapFavorite: () {
                          context.read<ListFavoritesBloc>().add(
                                ListFavoritesRemoveItem(
                                  id: item.id!,
                                ),
                              );
                        },
                      );
                    },
                  ),
                ),
              );
            } else if (state is ListFavoritesFailureLoad) {
              return const Center(
                child: Text('Failed to load list favorites shorten url'),
              );
            }
            return const LoaderByPlatform();
          },
        ),
      ),
    );
  }
}
