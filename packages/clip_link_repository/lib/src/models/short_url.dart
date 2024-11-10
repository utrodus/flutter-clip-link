import 'package:equatable/equatable.dart';

class ShortUrl extends Equatable {
  final String shortUrl;
  const ShortUrl({required this.shortUrl});

  @override
  List<Object> get props => [shortUrl];
}
