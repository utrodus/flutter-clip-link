import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:spoo_me_api/spoo_me_api.dart';

class SpooMeApiClient {
  SpooMeApiClient({http.Client? httpClient})
      : _httpClient = httpClient ?? http.Client();

  final http.Client _httpClient;

  String getErrorName(http.Response response) {
    final responseBody = jsonDecode(response.body) as Map<String, dynamic>;
    final errorName = responseBody.keys.first;
    return errorName;
  }

  /// Request shorten URL
  Future<ShortUrlResponse> postShortenUrl(
      {required ShortUrlParam param}) async {
    try {
      final headers = {
        'Accept': 'application/json',
        'Content-Type': 'application/x-www-form-urlencoded'
      };

      final response = await _httpClient.post(
        Uri.parse(ApiEndpoints.baseUrl),
        headers: headers,
        body: param.toJson(),
      );

      if (response.statusCode == 400) {
        final errorName = getErrorName(response);

        switch (errorName) {
          case 'UrlError':
            throw InvalidUrlRequestFailure();
          case 'AliasError':
            throw AliasRequestFailure();
          case 'PasswordError':
            throw PasswordInvalidRequestFailure();
          default:
            throw HttpRequestFailure();
        }
      }
      return ShortUrlResponse.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    } on InvalidUrlRequestFailure {
      rethrow;
    } on AliasRequestFailure {
      rethrow;
    } on PasswordInvalidRequestFailure {
      rethrow;
    } on HttpRequestFailure {
      rethrow;
    } catch (e) {
      throw Exception("Unexpected error: ${e.toString()}");
    }
  }

  // Get URL statistics
  Future<UrlStatisticsResponse> getUrlStatistics({
    required String shortCode,
    String? password,
  }) async {
    try {
      final headers = {
        'Accept': 'application/json',
        'Content-Type': 'application/x-www-form-urlencoded'
      };

      final response = await _httpClient.post(
        Uri.parse(
            "${ApiEndpoints.baseUrl}/${ApiEndpoints.urlStatistics}/$shortCode"),
        headers: headers,
        body: password != null
            ? {
                'password': password,
              }
            : {},
      );

      final errorName = getErrorName(response);
      if (response.statusCode == 404) {
        switch (errorName) {
          case 'UrlError':
            throw UrlNotFoundRequestFailure();
          default:
            throw Exception();
        }
      } else if (response.statusCode == 400) {
        if (errorName == 'PasswordError') {
          throw WrongPasswordFailure();
        }
      }
      return UrlStatisticsResponse.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    } on UrlNotFoundRequestFailure {
      rethrow;
    } on WrongPasswordFailure {
      rethrow;
    } catch (e) {
      throw Exception("Unexpected error: ${e.toString()}");
    }
  }
}
