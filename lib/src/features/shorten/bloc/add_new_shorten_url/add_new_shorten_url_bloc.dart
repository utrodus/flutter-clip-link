import 'package:bloc/bloc.dart';
import 'package:clip_link_repository/clip_link_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

part 'add_new_shorten_url_event.dart';
part 'add_new_shorten_url_state.dart';

class AddNewShortenUrlBloc
    extends Bloc<AddNewShortenUrlEvent, AddNewShortenUrlState> {
  AddNewShortenUrlBloc({required this.clipLinkRepository})
      : super(AddNewShortenUrlInitial()) {
    on<AddNewShortenUrlRequest>(_onAddNewShortenUrl);
  }

  final ClipLinkRepository clipLinkRepository;

  Future<void> _onAddNewShortenUrl(
    AddNewShortenUrlRequest event,
    Emitter<AddNewShortenUrlState> emit,
  ) async {
    emit(AddNewShortenUrlLoading());
    try {
      final result = await clipLinkRepository.generateShortUrl(
        url: event.url,
        alias: event.alias,
        password: event.password,
      );
      if (result) {
        emit(
          const AddNewShortenUrlSuccess(
            message: 'Success Generate Short Url',
          ),
        );
      } else {
        emit(
          const AddNewShortenUrlFailure(
            message: 'Failed to generate short url',
          ),
        );
      }
    } catch (e) {
      emit(AddNewShortenUrlFailure(message: e.toString()));
    }
  }
}
