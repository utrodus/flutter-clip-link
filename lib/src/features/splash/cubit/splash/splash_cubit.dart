import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(SplashInitial());

  Future<void> onLoaded() async {
    await Future.delayed(const Duration(milliseconds: 950));
    emit(SplashLoaded());
  }
}
