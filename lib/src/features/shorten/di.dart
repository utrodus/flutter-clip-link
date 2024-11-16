import 'package:flutter_clip_link/src/core/core.dart';
import 'package:flutter_clip_link/src/features/shorten/shorten.dart';

void shortenFeatureDI() {
  _initBloc();
  _initCubit();
}

void _initBloc() {
  sl.registerLazySingleton<AddNewShortenUrlBloc>(
    () => AddNewShortenUrlBloc(
      clipLinkRepository: sl(),
    ),
  );
}

void _initCubit() {
  sl.registerFactory<ListShortenCubit>(
    ListShortenCubit.new,
  );
}
