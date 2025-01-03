part of 'detail_shorten_url_bloc.dart';

sealed class DetailShortenUrlState extends Equatable {
  const DetailShortenUrlState();

  @override
  List<Object> get props => [];
}

final class DetailShortenUrlInitial extends DetailShortenUrlState {}

final class DetailShortenUrlLoading extends DetailShortenUrlState {}

final class DetailShortenUrlSuccess extends DetailShortenUrlState {
  const DetailShortenUrlSuccess({
    required this.urlStatistics,
  });

  final UrlStatistics urlStatistics;
  @override
  List<Object> get props => [urlStatistics];
}

final class DetailShortenUrlNotExist extends DetailShortenUrlState {
  const DetailShortenUrlNotExist({required this.message});
  final String message;
  @override
  List<Object> get props => [message];
}

final class DetailShortenUrlWrongPassword extends DetailShortenUrlState {
  const DetailShortenUrlWrongPassword({required this.message});
  final String message;
  @override
  List<Object> get props => [message];
}

final class DetailShortenUrlFailure extends DetailShortenUrlState {
  const DetailShortenUrlFailure({required this.message});
  final String message;

  @override
  List<Object> get props => [message];
}

final class DetailShortenUrlDeleteSuccess extends DetailShortenUrlState {
  const DetailShortenUrlDeleteSuccess({required this.message});
  final String message;

  @override
  List<Object> get props => [message];
}

final class DetailShortenUrlDeleteFailure extends DetailShortenUrlState {
  const DetailShortenUrlDeleteFailure({required this.message});
  final String message;

  @override
  List<Object> get props => [message];
}
