import 'package:json_annotation/json_annotation.dart';

part 'url_statistics_response.g.dart';

@JsonSerializable(
  createToJson: false,
  includeIfNull: false,
)
class UrlStatisticsResponse {
  @JsonKey(name: '_id')
  final String id;
  @JsonKey(name: 'short_code')
  final String shortCode;
  @JsonKey(name: 'total-clicks')
  final int totalClicks;
  @JsonKey(name: 'creation-date')
  final String creationDate;
  @JsonKey(name: 'last-click')
  final String? lastClickDate;
  @JsonKey(name: 'last-click-browser')
  final String? lastClickBrowser;
  @JsonKey(name: 'last-click-os')
  final String? lastClickOS;
  @JsonKey(name: 'average_redirection_time')
  final double averageRedirectionTime;

  @JsonKey(name: 'url')
  final String originalUrl;

  final String? password;

  UrlStatisticsResponse({
    required this.id,
    required this.shortCode,
    required this.totalClicks,
    required this.creationDate,
    required this.averageRedirectionTime,
    required this.originalUrl,
    this.lastClickDate,
    this.lastClickBrowser,
    this.lastClickOS,
    this.password,
  });

  factory UrlStatisticsResponse.fromJson(Map<String, dynamic> json) =>
      _$UrlStatisticsResponseFromJson(json);
}
