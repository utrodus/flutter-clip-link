import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clip_link/src/core/core.dart';
import 'package:flutter_clip_link/src/features/shorten/presentation/cubit/list_shorten_cubit.dart';
import 'package:flutter_clip_link/src/features/shorten/presentation/widgets/list_shorten_appbar.dart';
import 'package:flutter_clip_link/src/features/shorten/presentation/widgets/shorten_url_item.dart';
import 'package:flutter_clip_link/src/routes/routes.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ListShortenUrlPage extends StatelessWidget {
  const ListShortenUrlPage({super.key});

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);
    return Scaffold(
      appBar: responsive.isMobile || responsive.isTablet
          ? listShortenAppbar(
              context,
            )
          : null,
      floatingActionButton: responsive.onlyVisibleOnMobileTablet(
        child: FloatingActionButton(
          child: const Icon(
            Icons.add,
          ),
          onPressed: () {
            // TODO: add logic to handle if user not login then redirect to login page
            // TODO: if user has login then redirect to add new link page

            GoRouter.of(context).push(
              Routes.signin.path,
            );
            // GoRouter.of(context).go(
            //   '${Routes.listShorten.path}/${Routes.addNewShortenURL.path}',
            // );
          },
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.only(
            top: responsive.isMobile || responsive.isTablet ? 0 : 24,
            left: 20,
            right: 20,
            bottom: 24,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Hi 👋, Welcome to ClipLink',
                          style: context.textTheme.titleMedium,
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        Text(
                          'ClipLink App is a URL Shortener that lets '
                          'you create short links for all your '
                          'favorite websites!',
                          style: context.textTheme.bodyMedium,
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                      ],
                    ),
                  ),
                  responsive.onlyVisibleOnDesktopAndLarge(
                    child: CLButton(
                      text: 'Add New Link',
                      leading: const Icon(IconsaxPlusLinear.add),
                      minimumSize: const Size(44, 48),
                      onPressed: () {
                        // TODO: add logic to handle if user not login then redirect to login page
                        // TODO: if user has login then redirect to add new link page

                        GoRouter.of(context).push(
                          Routes.signin.path,
                        );
                        // GoRouter.of(context).go(
                        //   '${Routes.listShorten.path}/${Routes.addNewShortenURL.path}',
                        // );
                      },
                    ),
                  ),
                ],
              ),
              responsive.onlyVisibleOnDesktopAndLarge(
                child: const SizedBox(
                  height: 22,
                ),
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
