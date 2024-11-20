import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clip_link/src/core/core.dart';

class AppBlocObserver extends BlocObserver with BlocLoggy {
  /// [BlocObserver] for logging all bloc state changes, errors and events.
  const AppBlocObserver();
  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    logDebug('Bloc: ${bloc.runtimeType} | Change: $change');
  }

  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    logDebug('Bloc: ${bloc.runtimeType} | Created');
  }

  @override
  void onTransition(
    Bloc<Object?, Object?> bloc,
    Transition<Object?, Object?> transition,
  ) {
    final buffer = StringBuffer()
      ..write('Bloc: ${bloc.runtimeType} | ')
      ..writeln('${transition.event.runtimeType}')
      ..write('Transition: ${transition.currentState.runtimeType}')
      ..writeln(' => ${transition.nextState.runtimeType}')
      ..write('New State: ${transition.nextState}');
    logDebug(buffer.toString());
    super.onTransition(bloc, transition);
  }

  @override
  void onError(BlocBase<Object?> bloc, Object error, StackTrace stackTrace) {
    logError('Bloc: ${bloc.runtimeType} | $error', error, stackTrace);
    super.onError(bloc, error, stackTrace);
  }
}
