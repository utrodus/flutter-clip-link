import 'package:spoo_me_api/spoo_me_api.dart';

class UrlStatistics {
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

  const UrlStatistics({
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

  static UrlStatistics toModel(UrlStatisticsResponse urlStatisticsResponse) =>
      UrlStatistics(
        id: urlStatisticsResponse.id,
        shortCode: urlStatisticsResponse.shortCode,
        totalClicks: urlStatisticsResponse.totalClicks,
        creationDate: urlStatisticsResponse.creationDate,
        averageRedirectionTime: urlStatisticsResponse.averageRedirectionTime,
        originalUrl: urlStatisticsResponse.originalUrl,
        lastClickBrowser: urlStatisticsResponse.lastClickBrowser ?? '',
        lastClickOS: urlStatisticsResponse.lastClickOS ?? '',
        lastClickDate: urlStatisticsResponse.lastClickDate ?? '',
        password: urlStatisticsResponse.password ?? '',
      );
}
