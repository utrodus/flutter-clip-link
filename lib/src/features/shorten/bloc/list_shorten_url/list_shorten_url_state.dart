part of 'list_shorten_url_bloc.dart';

sealed class ListShortenUrlState extends Equatable {
  const ListShortenUrlState();

  @override
  List<Object> get props => [];
}

final class ListShortenUrlInitial extends ListShortenUrlState {}

final class ListShortenUrlLoading extends ListShortenUrlState {}

final class ListShortenUrlSuccessLoad extends ListShortenUrlState {
  const ListShortenUrlSuccessLoad({required this.shortenItems});
  final List<ShortUrlItem> shortenItems;

  @override
  List<Object> get props => [shortenItems];
}

final class ListShortenUrlLoadFailure extends ListShortenUrlState {
  const ListShortenUrlLoadFailure({required this.message});
  final String message;

  @override
  List<Object> get props => [message];
}

final class ListShortenUrlSuccessAddToFavorites extends ListShortenUrlState {
  const ListShortenUrlSuccessAddToFavorites({required this.message});
  final String message;

  @override
  List<Object> get props => [message];
}

final class ListShortenUrlSuccessRemoveFromFavorites
    extends ListShortenUrlState {
  const ListShortenUrlSuccessRemoveFromFavorites({required this.message});
  final String message;

  @override
  List<Object> get props => [message];
}

final class ListShortenUrlFailureAddToFavorites extends ListShortenUrlState {
  const ListShortenUrlFailureAddToFavorites({required this.message});
  final String message;

  @override
  List<Object> get props => [message];
}

final class ListShortenUrlFailureRemoveFromFavorites
    extends ListShortenUrlState {
  const ListShortenUrlFailureRemoveFromFavorites({required this.message});
  final String message;

  @override
  List<Object> get props => [message];
}
