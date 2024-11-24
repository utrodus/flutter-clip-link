import 'package:flutter_clip_link/src/core/core.dart';
import 'package:flutter_clip_link/src/features/favorited/favorited.dart';

void favoritedFeatureDI() {
  _initBloc();
}

void _initBloc() {
  sl.registerLazySingleton<ListFavoritesBloc>(
    () => ListFavoritesBloc(
      clipLinkRepository: sl(),
    ),
  );
}
