import 'package:json_annotation/json_annotation.dart';

part 'short_url.g.dart';

@JsonSerializable(
  createToJson: false,
)
class ShortUrl {
  ShortUrl({
    required this.url,
  });

  factory ShortUrl.fromJson(Map<String, dynamic> json) =>
      _$ShortUrlFromJson(json);

  @JsonKey(name: 'short_url')
  final String url;
}
