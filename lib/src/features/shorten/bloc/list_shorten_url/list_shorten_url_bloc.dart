import 'package:bloc/bloc.dart';
import 'package:clip_link_repository/clip_link_repository.dart';
import 'package:equatable/equatable.dart';

part 'list_shorten_url_event.dart';
part 'list_shorten_url_state.dart';

class ListShortenUrlBloc
    extends Bloc<ListShortenUrlEvent, ListShortenUrlState> {
  ListShortenUrlBloc({required this.clipLinkRepository})
      : super(ListShortenUrlInitial()) {
    on<ListShortenUrlLoadRecent>(_onLoadRecentsShortenUrl);
    on<ListShortenUrlAddToFavorites>(_onAddToFavorites);
    on<ListShortenUrlRemoveFromFavorites>(_onRemoveFromFavorites);
  }
  final ClipLinkRepository clipLinkRepository;

  Future<void> _onLoadRecentsShortenUrl(
    ListShortenUrlLoadRecent event,
    Emitter<ListShortenUrlState> emit,
  ) async {
    emit(ListShortenUrlLoading());
    try {
      final stream = clipLinkRepository.getRecentsShortenedUrlItems();
      await emit.forEach(
        stream,
        onData: (items) => ListShortenUrlSuccessLoad(shortenItems: items),
        onError: (error, stackTrace) => ListShortenUrlLoadFailure(
          message: error.toString(),
        ),
      );
    } catch (e) {
      emit(ListShortenUrlLoadFailure(message: e.toString()));
    }
  }

  Future<void> _onAddToFavorites(
    ListShortenUrlAddToFavorites event,
    Emitter<ListShortenUrlState> emit,
  ) async {
    emit(ListShortenUrlLoading());
    try {
      await clipLinkRepository.addToFavorites(id: event.id);
      emit(
        const ListShortenUrlSuccessAddToFavorites(
          message: 'Success Add to Favorites',
        ),
      );
    } catch (e) {
      emit(ListShortenUrlFailureAddToFavorites(message: e.toString()));
    }
  }

  Future<void> _onRemoveFromFavorites(
    ListShortenUrlRemoveFromFavorites event,
    Emitter<ListShortenUrlState> emit,
  ) async {
    emit(ListShortenUrlLoading());
    try {
      await clipLinkRepository.removeFromFavorites(id: event.id);
      emit(
        const ListShortenUrlSuccessRemoveFromFavorites(
          message: 'Success Remove Item From Favorites',
        ),
      );
    } catch (e) {
      emit(ListShortenUrlFailureRemoveFromFavorites(message: e.toString()));
    }
  }
}
