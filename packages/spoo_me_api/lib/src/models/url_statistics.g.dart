// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'url_statistics.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UrlStatisticsResponse _$UrlStatisticsFromJson(Map<String, dynamic> json) =>
    UrlStatisticsResponse(
      id: json['_id'] as String,
      shortCode: json['short_code'] as String,
      totalClicks: (json['total-clicks'] as num).toInt(),
      creationDate: json['creation-date'] as String,
      lastClickDate: json['last-click'] as String,
      lastClickBrowser: json['last-click-browser'] as String,
      lastClickOS: json['last-click-os'] as String,
      averageRedirectionTime:
          (json['average_redirection_time'] as num).toDouble(),
      originalUrl: json['url'] as String,
      password: json['password'] as String?,
    );
