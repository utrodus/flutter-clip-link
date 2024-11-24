import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clip_link/src/core/core.dart';
import 'package:flutter_clip_link/src/features/favorited/favorited.dart';
import 'package:flutter_clip_link/src/features/main/main.dart';
import 'package:flutter_clip_link/src/features/settings/settings.dart';
import 'package:flutter_clip_link/src/features/shorten/shorten.dart';
import 'package:flutter_clip_link/src/features/splash/splash.dart';
import 'package:flutter_clip_link/src/routes/routes.dart';
import 'package:go_router/go_router.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shortenSectionNavigatorKey = GlobalKey<NavigatorState>();
final _favoritedSectionNavigatorKey = GlobalKey<NavigatorState>();
final _settingsSectionNavigatorKey = GlobalKey<NavigatorState>();

GoRouter appRouter = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: kIsWeb ? Routes.listShorten.path : Routes.splash.path,
  debugLogDiagnostics: kDebugMode,
  routes: [
    GoRoute(
      path: Routes.splash.path,
      builder: (_, __) => BlocProvider(
        create: (context) => sl<SplashCubit>()..onLoaded(),
        child: const SplashPage(),
      ),
    ),
    StatefulShellRoute.indexedStack(
      builder: (context, state, navShell) {
        return BlocProvider(
          create: (context) => sl<ScaffoldNavRailCubit>(),
          child: MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => sl<ListShortenUrlBloc>()
                  ..add(
                    ListShortenUrlLoadRecent(),
                  ),
              ),
              BlocProvider(
                create: (context) => sl<AddNewShortenUrlBloc>(),
              ),
              BlocProvider(
                create: (context) => sl<DetailShortenUrlBloc>(),
              ),
              BlocProvider(
                create: (context) => sl<ListFavoritesBloc>()
                  ..add(
                    ListFavoritesLoad(),
                  ),
              ),
            ],
            child: MainPage(
              navShell: navShell,
            ),
          ),
        );
      },
      branches: [
        StatefulShellBranch(
          navigatorKey: _shortenSectionNavigatorKey,
          routes: [
            GoRoute(
              path: Routes.listShorten.path,
              pageBuilder: (context, state) => const NoTransitionPage(
                child: ListShortenUrlPage(),
              ),
              routes: [
                GoRoute(
                  path: Routes.addNewShortenURL.path,
                  builder: (context, state) => const AddNewShortenUrlPage(),
                ),
                GoRoute(
                  name: Routes.inputPassword.name,
                  path: Routes.inputPassword.path,
                  builder: (context, state) {
                    final shortCode = state.pathParameters['shortCode'] ?? '';
                    return InputPasswordPage(
                      shortCode: shortCode,
                    );
                  },
                ),
                GoRoute(
                  name: Routes.detailShortenURL.name,
                  path: Routes.detailShortenURL.path,
                  builder: (context, state) {
                    final shortCode = state.pathParameters['shortCode'] ?? '';
                    final password = state.extra as String?;
                    context.read<DetailShortenUrlBloc>().add(
                          DetailShortenUrlLoad(
                            shortCode: shortCode,
                            password: password,
                          ),
                        );
                    return const DetailShortenUrlPage();
                  },
                ),
              ],
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _favoritedSectionNavigatorKey,
          routes: [
            GoRoute(
              path: Routes.listFavorites.path,
              pageBuilder: (context, state) => const NoTransitionPage(
                child: ListFavoritesPage(),
              ),
              routes: [
                GoRoute(
                  path: Routes.inputPassword.path,
                  builder: (context, state) {
                    final shortCode = state.pathParameters['shortCode'] ?? '';
                    return InputPasswordPage(
                      shortCode: shortCode,
                    );
                  },
                ),
                GoRoute(
                  name: Routes.detailFavorites.name,
                  path: Routes.detailFavorites.path,
                  builder: (context, state) {
                    final shortCode = state.pathParameters['shortCode'] ?? '';
                    final password = state.extra as String?;
                    context.read<DetailShortenUrlBloc>().add(
                          DetailShortenUrlLoad(
                            shortCode: shortCode,
                            password: password,
                          ),
                        );
                    return const DetailShortenUrlPage();
                  },
                ),
              ],
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _settingsSectionNavigatorKey,
          routes: [
            GoRoute(
              path: Routes.settings.path,
              pageBuilder: (context, state) => const NoTransitionPage(
                child: SettingsPage(),
              ),
              routes: [
                GoRoute(
                  path: Routes.about.path,
                  builder: (context, state) {
                    return const AboutPage();
                  },
                ),
                GoRoute(
                  path: Routes.aboutDeveloper.path,
                  builder: (context, state) => const AboutDeveloperPage(),
                ),
                GoRoute(
                  path: Routes.apiRateLimits.path,
                  builder: (context, state) => const ApiRateLimitPage(),
                ),
              ],
            ),
          ],
        ),
      ],
    ),
  ],
);
