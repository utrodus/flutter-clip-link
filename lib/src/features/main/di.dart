import 'package:flutter_clip_link/src/core/core.dart';
import 'package:flutter_clip_link/src/features/main/main.dart';

void mainFeatureDI() {
  _initCubit();
}

void _initCubit() {
  sl.registerFactory(ScaffoldNavRailCubit.new);
}
