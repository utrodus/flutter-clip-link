part of 'get_list_shorten_url_bloc.dart';

sealed class GetListShortenUrlEvent extends Equatable {
  const GetListShortenUrlEvent();

  @override
  List<Object> get props => [];
}

class GetListShortenUrlRecents extends GetListShortenUrlEvent {}
