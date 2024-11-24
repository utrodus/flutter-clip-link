import 'package:bloc/bloc.dart';
import 'package:clip_link_repository/clip_link_repository.dart';
import 'package:equatable/equatable.dart';

part 'list_favorites_event.dart';
part 'list_favorites_state.dart';

class ListFavoritesBloc extends Bloc<ListFavoritesEvent, ListFavoritesState> {
  ListFavoritesBloc({
    required this.clipLinkRepository,
  }) : super(ListFavoritesInitial()) {
    on<ListFavoritesLoad>(
      _onListFavoritesLoad,
    );
    on<ListFavoritesRemoveItem>(
      _onRemoveFromFavorites,
    );
  }

  final ClipLinkRepository clipLinkRepository;

  Future<void> _onListFavoritesLoad(
    ListFavoritesLoad event,
    Emitter<ListFavoritesState> emit,
  ) async {
    emit(ListFavoritesLoading());
    try {
      final stream = clipLinkRepository.getAllFavoritesShortUrlItems();
      await emit.forEach(
        stream,
        onData: (items) => ListFavoritesSuccessLoad(favoriteItems: items),
        onError: (error, stackTrace) => ListFavoritesFailureLoad(
          message: error.toString(),
        ),
      );
    } catch (e) {
      emit(ListFavoritesFailureLoad(message: e.toString()));
    }
  }

  Future<void> _onRemoveFromFavorites(
    ListFavoritesRemoveItem event,
    Emitter<ListFavoritesState> emit,
  ) async {
    emit(ListFavoritesLoading());
    try {
      await clipLinkRepository.removeFromFavorites(id: event.id);
      emit(
        const ListFavoritesSuccessRemove(
          message: 'Success Remove Item From Favorites',
        ),
      );
    } catch (e) {
      emit(ListFavoritesFailureRemove(message: e.toString()));
    }
  }
}
