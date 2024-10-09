import 'package:flutter_clip_link/src/features/auth/di.dart';
import 'package:flutter_clip_link/src/features/main/main.dart';

Future<void> initDI() async {
  authFeatureDI();
  mainFeatureDI();
}
