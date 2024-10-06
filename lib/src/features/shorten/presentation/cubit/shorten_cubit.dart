import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'shorten_state.dart';

class ShortenCubit extends Cubit<ShortenState> {
  ShortenCubit() : super(ShortenInitial());
}
