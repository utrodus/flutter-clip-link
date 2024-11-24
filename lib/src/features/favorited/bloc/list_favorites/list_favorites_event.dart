part of 'list_favorites_bloc.dart';

sealed class ListFavoritesEvent extends Equatable {
  const ListFavoritesEvent();

  @override
  List<Object> get props => [];
}

class ListFavoritesLoad extends ListFavoritesEvent {}

class ListFavoritesRemoveItem extends ListFavoritesEvent {
  const ListFavoritesRemoveItem({required this.id});
  final int id;

  @override
  List<Object> get props => [id];
}
