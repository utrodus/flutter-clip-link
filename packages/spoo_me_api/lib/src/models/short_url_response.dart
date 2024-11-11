import 'package:json_annotation/json_annotation.dart';

part 'short_url_response.g.dart';

@JsonSerializable(
  createToJson: false,
)
class ShortUrlResponse {
  ShortUrlResponse({
    required this.url,
  });

  factory ShortUrlResponse.fromJson(Map<String, dynamic> json) =>
      _$ShortUrlResponseFromJson(json);

  @JsonKey(name: 'short_url')
  final String url;
}
