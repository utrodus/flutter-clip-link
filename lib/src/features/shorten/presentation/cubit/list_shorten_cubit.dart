import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clip_link/src/features/shorten/shorten.dart';

part 'list_shorten_state.dart';

class ListShortenCubit extends Cubit<ListShortenState> {
  ListShortenCubit() : super(ListShortenInitial());

  Future<void> getAllListShorten() async {
    emit(ListShortenLoading());
    await Future.delayed(const Duration(seconds: 2));
    emit(
      ListShortenLoaded(
        shortenItems: shortenUrlMock,
        selectedShortenItems: const [],
      ),
    );
  }
}
