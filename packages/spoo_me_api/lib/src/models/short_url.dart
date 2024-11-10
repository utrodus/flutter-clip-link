import 'package:json_annotation/json_annotation.dart';

part 'short_url.g.dart';

@JsonSerializable(
  createToJson: false,
)
class ShortUrlResponse {
  ShortUrlResponse({
    required this.url,
  });

  factory ShortUrlResponse.fromJson(Map<String, dynamic> json) =>
      _$ShortUrlFromJson(json);

  @JsonKey(name: 'short_url')
  final String url;
}
