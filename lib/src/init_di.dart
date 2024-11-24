import 'package:clip_link_repository/clip_link_repository.dart';
import 'package:flutter_clip_link/src/core/core.dart';
import 'package:flutter_clip_link/src/features/favorited/di.dart';
import 'package:flutter_clip_link/src/features/main/main.dart';
import 'package:flutter_clip_link/src/features/settings/di.dart';
import 'package:flutter_clip_link/src/features/shorten/di.dart';
import 'package:flutter_clip_link/src/features/splash/di.dart';

Future<void> initDI() async {
  sl.registerLazySingleton<ClipLinkRepository>(ClipLinkRepository.new);
  settingsFeatureDI();
  splashFeatureDI();
  mainFeatureDI();
  shortenFeatureDI();
  favoritedFeatureDI();
}
