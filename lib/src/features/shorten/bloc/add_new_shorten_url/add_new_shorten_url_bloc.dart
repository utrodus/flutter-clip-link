import 'package:bloc/bloc.dart';
import 'package:clip_link_repository/clip_link_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:spoo_me_api/spoo_me_api.dart';

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
      if (result != null) {
        emit(
          AddNewShortenUrlSuccess(
            title: 'Short URL Generated',
            message: 'Your short URL has been successfully created!',
            shortenUrl: result,
          ),
        );
      } else {
        emit(
          const AddNewShortenUrlFailure(
            title: 'Failed to generate URL',
            message: 'We encountered an error while generating '
                'the short URL. Please try again later.',
          ),
        );
      }
    } on InvalidUrlRequestFailure catch (e) {
      emit(AddNewShortenUrlFailure(title: 'Invalid Url', message: e.message));
    } on AliasRequestFailure catch (e) {
      emit(
        AddNewShortenUrlFailure(
          title: 'Alias is already taken',
          message: e.message,
        ),
      );
    } on PasswordInvalidRequestFailure catch (e) {
      emit(
        AddNewShortenUrlFailure(
          title: 'Password not valid',
          message: e.message,
        ),
      );
    } on HttpRequestFailure catch (e) {
      emit(AddNewShortenUrlFailure(title: 'HTTP Error', message: e.message));
    } on Exception catch (e) {
      emit(AddNewShortenUrlFailure(title: 'Error', message: e.toString()));
    }
  }
}
