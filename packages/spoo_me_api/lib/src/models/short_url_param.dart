import 'package:json_annotation/json_annotation.dart';

part 'short_url_param.g.dart';

@JsonSerializable(
  includeIfNull: false,
)
class ShortUrlParam {
  ShortUrlParam({
    required this.url,
    this.alias,
    this.password,
  });

  final String url;
  final String? alias;
  final String? password;

  Map<String, dynamic> toJson() => _$ShortUrlParamToJson(this);
}
