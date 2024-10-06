import 'package:flutter_clip_link/src/core/core.dart';
import 'package:flutter_clip_link/src/features/auth/presentation/cubit/splash/splash_cubit.dart';

void authDI() {
  _initCubit();
}

void _initCubit() {
  sl.registerFactory(SplashCubit.new);
}
