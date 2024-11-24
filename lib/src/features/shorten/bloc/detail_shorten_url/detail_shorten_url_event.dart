part of 'detail_shorten_url_bloc.dart';

sealed class DetailShortenUrlEvent extends Equatable {
  const DetailShortenUrlEvent();

  @override
  List<Object?> get props => [];
}

class DetailShortenUrlLoad extends DetailShortenUrlEvent {
  const DetailShortenUrlLoad({required this.shortCode, this.password});
  final String shortCode;
  final String? password;

  @override
  List<Object?> get props => [shortCode, password];
}

class DetailShortenUrlDeleteItem extends DetailShortenUrlEvent {
  const DetailShortenUrlDeleteItem({required this.shortCode});
  final String shortCode;

  @override
  List<Object?> get props => [shortCode];
}
