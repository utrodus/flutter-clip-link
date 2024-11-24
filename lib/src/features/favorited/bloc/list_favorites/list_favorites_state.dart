part of 'list_favorites_bloc.dart';

sealed class ListFavoritesState extends Equatable {
  const ListFavoritesState();

  @override
  List<Object> get props => [];
}

final class ListFavoritesInitial extends ListFavoritesState {}

final class ListFavoritesLoading extends ListFavoritesState {}

final class ListFavoritesSuccessLoad extends ListFavoritesState {
  const ListFavoritesSuccessLoad({required this.favoriteItems});

  final List<ShortUrlItem> favoriteItems;

  @override
  List<Object> get props => [favoriteItems];
}

final class ListFavoritesFailureLoad extends ListFavoritesState {
  const ListFavoritesFailureLoad({required this.message});
  final String message;

  @override
  List<Object> get props => [message];
}

final class ListFavoritesSuccessRemove extends ListFavoritesState {
  const ListFavoritesSuccessRemove({required this.message});

  final String message;

  @override
  List<Object> get props => [message];
}

final class ListFavoritesFailureRemove extends ListFavoritesState {
  const ListFavoritesFailureRemove({required this.message});

  final String message;

  @override
  List<Object> get props => [message];
}
