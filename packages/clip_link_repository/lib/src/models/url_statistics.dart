import 'package:equatable/equatable.dart';

class UrlStatistics extends Equatable {
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
