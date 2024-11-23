// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'url_statistics_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UrlStatisticsResponse _$UrlStatisticsResponseFromJson(
        Map<String, dynamic> json) =>
    UrlStatisticsResponse(
      id: json['_id'] as String,
      shortCode: json['short_code'] as String,
      totalClicks: (json['total-clicks'] as num).toInt(),
      creationDate: json['creation-date'] as String,
      averageRedirectionTime:
          (json['average_redirection_time'] as num).toDouble(),
      originalUrl: json['url'] as String,
      lastClickDate: json['last-click'] as String?,
      lastClickBrowser: json['last-click-browser'] as String?,
      lastClickOS: json['last-click-os'] as String?,
      password: json['password'] as String?,
    );
