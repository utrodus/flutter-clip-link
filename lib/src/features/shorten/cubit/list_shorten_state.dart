part of 'list_shorten_cubit.dart';

abstract class ListShortenState extends Equatable {
  const ListShortenState();
  @override
  List<Object?> get props => [];
}

class ListShortenInitial extends ListShortenState {}

class ListShortenLoading extends ListShortenState {}

class ListShortenLoaded extends ListShortenState {
  const ListShortenLoaded({
    required this.shortenItems,
    required this.selectedShortenItems,
  });

  final List<ShortenItemEntity> shortenItems;
  final List<ShortenItemEntity> selectedShortenItems;

  @override
  List<Object?> get props => [
        shortenItems,
        selectedShortenItems,
      ];
}
