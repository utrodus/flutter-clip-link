import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clip_link/src/core/core.dart';
import 'package:flutter_clip_link/src/features/shorten/shorten.dart';
import 'package:flutter_clip_link/src/features/shorten/view/widgets/widgets.dart';
import 'package:flutter_clip_link/src/routes/routes.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

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
            GoRouter.of(context).go(
              '${Routes.listShorten.path}/${Routes.addNewShortenURL.path}',
            );
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
          child: Align(
            alignment: Alignment.center,
            child: ConstrainedBox(
              constraints: const BoxConstraints(
                maxWidth: Breakpoints.tablet,
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
                      const SizedBox(
                        width: 16,
                      ),
                      responsive.onlyVisibleOnDesktopAndLarge(
                        child: CLButton(
                          text: 'Add New Link',
                          isLoading: false,
                          leading: const Icon(IconsaxPlusLinear.add),
                          minimumSize: const Size(44, 48),
                          onPressed: () {
                            GoRouter.of(context).go(
                              '${Routes.listShorten.path}/${Routes.addNewShortenURL.path}',
                            );
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
                  BlocBuilder<GetListShortenUrlBloc, GetListShortenUrlState>(
                    builder: (context, state) {
                      if (state is GetListShortenUrlLoading) {
                        return const ListShortenLoading();
                      } else if (state is GetListShortenUrlSuccess) {
                        if (state.shortenItems.isEmpty) {
                          return const ListShortenEmpty();
                        }
                        return ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: state.shortenItems.length,
                          itemBuilder: (ctx, index) {
                            final item = state.shortenItems[index];
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
                                        Routes.detailShortenURL.name,
                                        pathParameters: {
                                          'shortCode': item.shortCode,
                                        },
                                      );
                                // item.isHavePassword
                                //     ? GoRouter.of(context).go(
                                //         Uri(
                                //           path:
                                //               '${Routes.listShorten.path}/${Routes.inputPassword.path}',
                                //           queryParameters: {
                                //             'shortCode': item.shortCode,
                                //           },
                                //         ).toString(),
                                //       )
                                //     : GoRouter.of(context).go(
                                //         '${Routes.listShorten.path}/${Routes.detailShortenURL.path}',
                                //       );
                              },
                              onTapFavorite: () {
                                debugPrint('coba');
                              },
                            );
                          },
                        );
                      } else if (state is GetListShortenUrlFailure) {
                        return const Center(
                          child: Text('Failed to load list shorten url'),
                        );
                      }
                      return const ListShortenEmpty();
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
