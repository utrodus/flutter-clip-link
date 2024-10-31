import 'package:json_annotation/json_annotation.dart';

part 'url_statistics.g.dart';

@JsonSerializable(
  createToJson: false,
  includeIfNull: false,
)
class UrlStatistics {
  @JsonKey(name: '_id')
  final String id;
  @JsonKey(name: 'short_code')
  final String shortCode;
  @JsonKey(name: 'total-clicks')
  final int totalClicks;
  @JsonKey(name: 'creation-date')
  final String creationDate;
  @JsonKey(name: 'last-click')
  final String lastClickDate;
  @JsonKey(name: 'last-click-browser')
  final String lastClickBrowser;
  @JsonKey(name: 'last-click-os')
  final String lastClickOS;
  @JsonKey(name: 'average_redirection_time')
  final double averageRedirectionTime;

  final String? password;
  @JsonKey(name: 'url')
  final String originalUrl;

  UrlStatistics({
    required this.id,
    required this.shortCode,
    required this.totalClicks,
    required this.creationDate,
    required this.lastClickDate,
    required this.lastClickBrowser,
    required this.lastClickOS,
    required this.averageRedirectionTime,
    required this.originalUrl,
    this.password,
  });

  factory UrlStatistics.fromJson(Map<String, dynamic> json) =>
      _$UrlStatisticsFromJson(json);
}
