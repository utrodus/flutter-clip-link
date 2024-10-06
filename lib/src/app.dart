import 'package:flutter/material.dart';
import 'package:flutter_clip_link/src/core/res/app_theme.dart';
import 'package:flutter_clip_link/src/routes/app_router.dart';

class ClipLinkApp extends StatelessWidget {
  const ClipLinkApp({super.key});

  @override
  Widget build(BuildContext context) {
    final appTheme = AppTheme();
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Clip Link App',
      themeMode: ThemeMode.light,
      theme: appTheme.light,
      darkTheme: appTheme.dark,
      routerConfig: AppRouter.router,
    );
  }
}
