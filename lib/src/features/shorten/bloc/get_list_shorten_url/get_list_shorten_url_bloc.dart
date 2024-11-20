import 'package:bloc/bloc.dart';
import 'package:clip_link_repository/clip_link_repository.dart';
import 'package:equatable/equatable.dart';

part 'get_list_shorten_url_event.dart';
part 'get_list_shorten_url_state.dart';

class GetListShortenUrlBloc
    extends Bloc<GetListShortenUrlEvent, GetListShortenUrlState> {
  GetListShortenUrlBloc({required this.clipLinkRepository})
      : super(GetListShortenUrlInitial()) {
    on<GetListShortenUrlRecents>(_onLoadRecentsShortenUrl);
  }
  final ClipLinkRepository clipLinkRepository;

  Future<void> _onLoadRecentsShortenUrl(
    GetListShortenUrlEvent event,
    Emitter<GetListShortenUrlState> emit,
  ) async {
    emit(GetListShortenUrlLoading());
    try {
      final stream = clipLinkRepository.getRecentsShortenedUrlItems();
      await emit.forEach(
        stream,
        onData: (items) => GetListShortenUrlSuccess(shortenItems: items),
        onError: (error, stackTrace) => GetListShortenUrlFailure(
          message: error.toString(),
        ),
      );
    } catch (e) {
      emit(GetListShortenUrlFailure(message: e.toString()));
    }
  }
}
