import 'package:loggy/loggy.dart';

mixin UiLoggy implements LoggyType {
  @override
  Loggy<UiLoggy> get loggy => Loggy<UiLoggy>('UI: $runtimeType');
}

mixin BlocLoggy implements LoggyType {
  @override
  Loggy<BlocLoggy> get loggy => Loggy<BlocLoggy>('BLOC: $runtimeType');
}
