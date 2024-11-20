part of 'add_new_shorten_url_bloc.dart';

@immutable
sealed class AddNewShortenUrlState extends Equatable {
  const AddNewShortenUrlState();

  @override
  List<Object> get props => [];
}

final class AddNewShortenUrlInitial extends AddNewShortenUrlState {}

final class AddNewShortenUrlLoading extends AddNewShortenUrlState {}

final class AddNewShortenUrlSuccess extends AddNewShortenUrlState {
  const AddNewShortenUrlSuccess({
    required this.shortenUrl,
    required this.title,
    required this.message,
  });

  final String shortenUrl;
  final String title;
  final String message;
  @override
  List<Object> get props => [title, message, shortenUrl];
}

final class AddNewShortenUrlFailure extends AddNewShortenUrlState {
  const AddNewShortenUrlFailure({
    required this.title,
    required this.message,
  });

  final String title;
  final String message;

  @override
  List<Object> get props => [message];
}
