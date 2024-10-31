// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'short_url_param.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShortUrlParam _$ShortUrlParamFromJson(Map<String, dynamic> json) =>
    ShortUrlParam(
      url: json['url'] as String,
      alias: json['alias'] as String?,
      password: json['password'] as String?,
    );

Map<String, dynamic> _$ShortUrlParamToJson(ShortUrlParam instance) {
  final val = <String, dynamic>{
    'url': instance.url,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('alias', instance.alias);
  writeNotNull('password', instance.password);
  return val;
}
