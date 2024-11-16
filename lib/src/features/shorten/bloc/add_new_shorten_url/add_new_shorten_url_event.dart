part of 'add_new_shorten_url_bloc.dart';

sealed class AddNewShortenUrlEvent extends Equatable {
  const AddNewShortenUrlEvent();

  @override
  List<Object?> get props => [];
}

class AddNewShortenUrlRequest extends AddNewShortenUrlEvent {
  const AddNewShortenUrlRequest({
    required this.url,
    this.alias,
    this.password,
  });
  final String url;
  final String? alias;
  final String? password;

  @override
  List<Object?> get props => [url, alias, password];
}
