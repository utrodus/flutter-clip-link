import 'package:flutter_clip_link/src/core/core.dart';
import 'package:flutter_clip_link/src/features/shorten/shorten.dart';

void shortenFeatureDI() {
  _initBloc();
}

void _initBloc() {
  sl
    ..registerLazySingleton<ListShortenUrlBloc>(
      () => ListShortenUrlBloc(
        clipLinkRepository: sl(),
      ),
    )
    ..registerLazySingleton<DetailShortenUrlBloc>(
      () => DetailShortenUrlBloc(
        clipLinkRepository: sl(),
      ),
    )
    ..registerLazySingleton<AddNewShortenUrlBloc>(
      () => AddNewShortenUrlBloc(
        clipLinkRepository: sl(),
      ),
    );
}
