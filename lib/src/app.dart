import 'package:flutter/material.dart';
import 'package:flutter_clip_link/src/core/core.dart';
import 'package:flutter_clip_link/src/routes/app_router.dart';

class ClipLinkApp extends StatelessWidget {
  const ClipLinkApp({super.key});

  @override
  Widget build(BuildContext context) {
    final appTheme = AppTheme();
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      scaffoldMessengerKey: scaffoldMessengerKey,
      title: 'Clip Link App',
      themeMode: ThemeMode.light,
      theme: appTheme.light,
      darkTheme: appTheme.dark,
      routerConfig: AppRouter.router,
    );
  }
}
