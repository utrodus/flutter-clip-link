import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clip_link/src/core/core.dart';
import 'package:flutter_clip_link/src/features/settings/settings.dart';
import 'package:flutter_clip_link/src/routes/app_router.dart';

class ClipLinkApp extends StatelessWidget {
  const ClipLinkApp({super.key});

  @override
  Widget build(BuildContext context) {
    final appTheme = AppTheme();
    return BlocProvider(
      create: (context) => sl<ThemeCubit>(),
      child: BlocBuilder<ThemeCubit, ThemeMode>(
        builder: (context, state) {
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            scaffoldMessengerKey: scaffoldMessengerKey,
            title: 'Clip Link App',
            themeMode: state,
            theme: appTheme.light,
            darkTheme: appTheme.dark,
            routerConfig: appRouter,
          );
        },
      ),
    );
  }
}
