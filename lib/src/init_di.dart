import 'package:flutter_clip_link/src/features/main/main.dart';
import 'package:flutter_clip_link/src/features/settings/di.dart';
import 'package:flutter_clip_link/src/features/shorten/di.dart';
import 'package:flutter_clip_link/src/features/splash/di.dart';

Future<void> initDI() async {
  settingsFeatureDI();
  authFeatureDI();
  mainFeatureDI();
  shortenFeatureDI();
}
