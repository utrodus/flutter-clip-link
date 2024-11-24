part of 'list_shorten_url_bloc.dart';

sealed class ListShortenUrlEvent extends Equatable {
  const ListShortenUrlEvent();

  @override
  List<Object> get props => [];
}

class ListShortenUrlLoadRecent extends ListShortenUrlEvent {}

class ListShortenUrlAddToFavorites extends ListShortenUrlEvent {
  const ListShortenUrlAddToFavorites({required this.id});
  final int id;

  @override
  List<Object> get props => [id];
}

class ListShortenUrlRemoveFromFavorites extends ListShortenUrlEvent {
  const ListShortenUrlRemoveFromFavorites({required this.id});
  final int id;

  @override
  List<Object> get props => [id];
}
