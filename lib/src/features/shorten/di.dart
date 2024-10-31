import 'package:flutter_clip_link/src/core/core.dart';
import 'package:flutter_clip_link/src/features/shorten/shorten.dart';

void shortenFeatureDI() {
  sl.registerFactory(ListShortenCubit.new);
}
