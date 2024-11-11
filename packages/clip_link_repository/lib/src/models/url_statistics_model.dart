import 'package:equatable/equatable.dart';
import 'package:spoo_me_api/spoo_me_api.dart';

class UrlStatisticsModel extends Equatable {
  final String id;
  final String shortCode;
  final int totalClicks;
  final String creationDate;
  final String lastClickDate;
  final String lastClickBrowser;
  final String lastClickOS;
  final double averageRedirectionTime;
  final String? password;
  final String originalUrl;

  const UrlStatisticsModel({
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

  static UrlStatisticsModel toModel(
          UrlStatisticsResponse urlStatisticsResponse) =>
      UrlStatisticsModel(
        id: urlStatisticsResponse.id,
        shortCode: urlStatisticsResponse.shortCode,
        totalClicks: urlStatisticsResponse.totalClicks,
        creationDate: urlStatisticsResponse.creationDate,
        lastClickDate: urlStatisticsResponse.lastClickDate,
        lastClickBrowser: urlStatisticsResponse.lastClickBrowser,
        lastClickOS: urlStatisticsResponse.lastClickOS,
        averageRedirectionTime: urlStatisticsResponse.averageRedirectionTime,
        originalUrl: urlStatisticsResponse.originalUrl,
        password: urlStatisticsResponse.password ?? '',
      );

  @override
  List<Object?> get props => [
        id,
        shortCode,
        totalClicks,
        creationDate,
        lastClickDate,
        lastClickBrowser,
        lastClickOS,
        averageRedirectionTime,
        originalUrl,
        password,
      ];
}
