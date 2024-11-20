part of 'get_list_shorten_url_bloc.dart';

sealed class GetListShortenUrlState extends Equatable {
  const GetListShortenUrlState();

  @override
  List<Object> get props => [];
}

final class GetListShortenUrlInitial extends GetListShortenUrlState {}

final class GetListShortenUrlLoading extends GetListShortenUrlState {}

final class GetListShortenUrlSuccess extends GetListShortenUrlState {
  const GetListShortenUrlSuccess({required this.shortenItems});
  final List<ShortUrlItem> shortenItems;

  @override
  List<Object> get props => [shortenItems];
}

final class GetListShortenUrlFailure extends GetListShortenUrlState {
  const GetListShortenUrlFailure({required this.message});
  final String message;

  @override
  List<Object> get props => [message];
}
