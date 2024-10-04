import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'shorten_state.dart';

class ShortenCubit extends Cubit<ShortenState> {
  ShortenCubit() : super(ShortenInitial());
}
