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
final _sectionNavigatorKey = GlobalKey<NavigatorState>();

class AppRouter {
  AppRouter._();

  static GoRouter router = GoRouter(
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
        builder: (context, state) => const ForgotPasswordPage(),
      ),
      GoRoute(
        path: Routes.successForgotPassword.path,
        builder: (context, state) => const SuccessForgotPasswordPage(),
      ),
      StatefulShellRoute.indexedStack(
        builder: (context, state, navShell) {
          return MainPage(
            navShell: navShell,
          );
        },
        branches: [
          StatefulShellBranch(
            navigatorKey: _sectionNavigatorKey,
            routes: [
              GoRoute(
                path: Routes.listShorten.path,
                builder: (context, state) => const ListShortenUrlPage(),
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
              GoRoute(
                path: Routes.listFavorites.path,
                builder: (context, state) => const ListFavoritesPage(),
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
              GoRoute(
                path: Routes.settings.path,
                builder: (context, state) => const SettingsPage(),
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
}
