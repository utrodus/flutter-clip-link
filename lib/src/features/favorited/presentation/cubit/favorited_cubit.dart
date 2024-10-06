import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'favorited_state.dart';

class FavoritedCubit extends Cubit<FavoritedState> {
  FavoritedCubit() : super(FavoritedInitial());
}
