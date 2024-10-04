import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'favorited_state.dart';

class FavoritedCubit extends Cubit<FavoritedState> {
  FavoritedCubit() : super(FavoritedInitial());
}
