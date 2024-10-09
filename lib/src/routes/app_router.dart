import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clip_link/src/core/core.dart';
import 'package:flutter_clip_link/src/features/auth/presentation/presentation.dart';
import 'package:flutter_clip_link/src/features/favorited/presentation/presentation.dart';
import 'package:flutter_clip_link/src/features/main/presentation/presentation.dart';
import 'package:flutter_clip_link/src/features/search/presentation/presentation.dart';
import 'package:flutter_clip_link/src/features/settings/presentation/presentation.dart';
import 'package:flutter_clip_link/src/features/shorten/presentation/presentation.dart';

import 'package:flutter_clip_link/src/routes/routes.dart';
import 'package:go_router/go_router.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shortenSectionNavigatorKey = GlobalKey<NavigatorState>();
final _favoritedSectionNavigatorKey = GlobalKey<NavigatorState>();
final _settingsSectionNavigatorKey = GlobalKey<NavigatorState>();

GoRouter appRouter = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: Routes.splash.path,
  debugLogDiagnostics: kDebugMode,
  routes: [
    GoRoute(
      path: Routes.splash.path,
      builder: (_, __) => BlocProvider(
        create: (context) => sl<SplashCubit>()..onLoaded(),
        child: const SplashPage(),
      ),
    ),
    GoRoute(
      path: Routes.signin.path,
      builder: (context, state) => const SignInPage(),
    ),
    GoRoute(
      path: Routes.signup.path,
      builder: (context, state) => const SignUpPage(),
    ),
    GoRoute(
      path: Routes.forgotPassword.path,
      builder: (context, state) => ForgotPasswordPage(),
    ),
    GoRoute(
      path: Routes.successForgotPassword.path,
      builder: (context, state) => const SuccessForgotPasswordPage(),
    ),
    StatefulShellRoute.indexedStack(
      builder: (context, state, navShell) {
        return BlocProvider(
          create: (context) => sl<ScaffoldNavRailCubit>(),
          child: MainPage(
            navShell: navShell,
          ),
        );
      },
      branches: [
        StatefulShellBranch(
          navigatorKey: _shortenSectionNavigatorKey,
          routes: [
            GoRoute(
              path: Routes.listShorten.path,
              pageBuilder: (context, state) =>
                  const NoTransitionPage(child: ListShortenUrlPage()),
              routes: [
                GoRoute(
                  path: Routes.addNewShortenURL.path,
                  builder: (context, state) => const AddNewShortenUrlPage(),
                ),
                GoRoute(
                  path: Routes.detailShortenURL.path,
                  builder: (context, state) {
                    final shortCode = state.pathParameters['shortCode']!;
                    return DetailShortenUrlPage(
                      shortCode: shortCode,
                    );
                  },
                ),
                GoRoute(
                  path: Routes.search.path,
                  builder: (context, state) {
                    return const SearchPage();
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
                  path: Routes.detailShortenURL.path,
                  builder: (context, state) {
                    final shortCode = state.pathParameters['shortCode']!;
                    return DetailShortenUrlPage(
                      shortCode: shortCode,
                    );
                  },
                ),
                GoRoute(
                  path: Routes.search.path,
                  builder: (context, state) {
                    return const SearchPage();
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
                  path: Routes.faq.path,
                  builder: (context, state) {
                    return const FaqPage();
                  },
                ),
              ],
            ),
          ],
        ),
      ],
    ),
  ],
);
