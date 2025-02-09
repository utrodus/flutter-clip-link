import 'package:bloc/bloc.dart';
import 'package:clip_link_repository/clip_link_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:spoo_me_api/spoo_me_api.dart';
part 'detail_shorten_url_event.dart';
part 'detail_shorten_url_state.dart';

class DetailShortenUrlBloc
    extends Bloc<DetailShortenUrlEvent, DetailShortenUrlState> {
  DetailShortenUrlBloc({required this.clipLinkRepository})
      : super(DetailShortenUrlInitial()) {
    on<DetailShortenUrlLoad>(_onDetailShortenUrlLoad);
    on<DetailShortenUrlDeleteItem>(_onDetailShortenUrlDeleteItem);
  }

  final ClipLinkRepository clipLinkRepository;

  Future<void> _onDetailShortenUrlLoad(
    DetailShortenUrlLoad event,
    Emitter<DetailShortenUrlState> emit,
  ) async {
    emit(DetailShortenUrlLoading());
    try {
      final result = await clipLinkRepository.loadUrlStatistics(
        shortCode: event.shortCode,
        password: event.password,
      );
      emit(DetailShortenUrlSuccess(urlStatistics: result));
    } on UrlNotFoundRequestFailure catch (e) {
      emit(DetailShortenUrlNotExist(message: e.message));
    } on WrongPasswordFailure catch (e) {
      emit(DetailShortenUrlWrongPassword(message: e.message));
    } on Exception catch (e) {
      emit(DetailShortenUrlFailure(message: e.toString()));
    }
  }

  Future<void> _onDetailShortenUrlDeleteItem(
    DetailShortenUrlDeleteItem event,
    Emitter<DetailShortenUrlState> emit,
  ) async {
    try {
      await clipLinkRepository.removeShortenUrlItem(shortCode: event.shortCode);
      emit(
        const DetailShortenUrlDeleteSuccess(message: 'Success Delete Item'),
      );
    } catch (e) {
      emit(DetailShortenUrlDeleteFailure(message: e.toString()));
    }
  }
}
