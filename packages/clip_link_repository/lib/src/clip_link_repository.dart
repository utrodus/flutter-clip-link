import 'package:spoo_me_api/spoo_me_api.dart';

import 'package:clip_link_repository/clip_link_repository.dart';

class ClipLinkRepository {
  final SpooMeApiClient _spooMeApiClient;

  ClipLinkRepository({SpooMeApiClient? spooMeApiClient})
      : _spooMeApiClient = spooMeApiClient ?? SpooMeApiClient();

  Future<ShortUrlModel> generateShortUrl(ShortUrlParam param) async {
    try {
      final response = await _spooMeApiClient.postShortenUrl(param: param);
      return ShortUrlModel.toModel(response);
    } catch (e) {
      rethrow;
    }
  }

  Future<UrlStatisticsModel> loadUrlStatistics({
    required String shortCode,
    String? password,
  }) async {
    try {
      final response = await _spooMeApiClient.getUrlStatistics(
          shortCode: shortCode, password: password);
      return UrlStatisticsModel.toModel(response);
    } catch (e) {
      rethrow;
    }
  }
}
