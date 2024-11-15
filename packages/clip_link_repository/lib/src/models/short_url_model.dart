import 'package:spoo_me_api/spoo_me_api.dart';

class ShortUrlModel {
  final String shortUrl;
  const ShortUrlModel({required this.shortUrl});

  static ShortUrlModel toModel(ShortUrlResponse shortUrlResponse) =>
      ShortUrlModel(shortUrl: shortUrlResponse.url);
}
