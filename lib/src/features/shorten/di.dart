import 'package:flutter_clip_link/src/core/core.dart';

import 'package:flutter_clip_link/src/features/shorten/presentation/cubit/list_shorten_cubit.dart';

void shortenFeatureDI() {
  _initCubit();
}

void _initCubit() {
  sl.registerFactory(ListShortenCubit.new);
}
