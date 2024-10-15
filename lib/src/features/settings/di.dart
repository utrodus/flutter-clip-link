import 'package:flutter_clip_link/src/core/core.dart';
import 'package:flutter_clip_link/src/features/settings/settings.dart';

void settingsFeatureDI() {
  _initCubit();
}

void _initCubit() {
  sl.registerFactory(ThemeCubit.new);
}
