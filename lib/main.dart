import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clip_link/src/app.dart';
import 'package:flutter_clip_link/src/core/core.dart';
import 'package:flutter_clip_link/src/init_di.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: kIsWeb
        ? HydratedStorage.webStorageDirectory
        : await getApplicationDocumentsDirectory(),
  );
  Bloc.observer = const AppBlocObserver();
  usePathUrlStrategy();
  initLoggy();
  await initDI();
  runApp(const ClipLinkApp());
}
