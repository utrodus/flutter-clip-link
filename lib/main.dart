import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clip_link/src/app.dart';
import 'package:flutter_clip_link/src/core/core.dart';
import 'package:flutter_clip_link/src/init_di.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initLoggy();
  Bloc.observer = const AppBlocObserver();

  await initDI();
  AppTheme.initGoogleFonts();
  runApp(const ClipLinkApp());
}
