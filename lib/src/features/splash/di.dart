import 'package:flutter_clip_link/src/core/core.dart';
import 'package:flutter_clip_link/src/features/splash/splash.dart';

void authFeatureDI() {
  _initCubit();
}

void _initCubit() {
  sl.registerFactory(SplashCubit.new);
}
