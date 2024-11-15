import 'package:clip_link_database/clip_link_database.dart';
import 'package:spoo_me_api/spoo_me_api.dart';
import 'package:clip_link_repository/clip_link_repository.dart';

class ClipLinkRepository {
  final SpooMeApiClient _spooMeApiClient;
  final ClipLinkDatabaseClient _clipLinkDatabaseClient;
  ClipLinkRepository({
    SpooMeApiClient? spooMeApiClient,
    ClipLinkDatabaseClient? clipLinkDatabaseClient,
  })  : _spooMeApiClient = spooMeApiClient ?? SpooMeApiClient(),
        _clipLinkDatabaseClient =
            clipLinkDatabaseClient ?? ClipLinkDatabaseClient();

  Future<bool> generateShortUrl({
    required String url,
    String? alias,
    String? password,
  }) async {
    try {
      final response = await _spooMeApiClient.postShortenUrl(
          url: url, alias: alias, password: password);

      final splitUrl = response.url.split('/');
      final shortCode = splitUrl.last;

      final shortUrlItem = ShortUrlItemModel(
        shortenedUrl: response.url,
        shortCode: shortCode,
        isHavePassword: password != null,
        password: password,
        originalUrl: url,
        isFavorited: false,
      );

      final result =
          await _clipLinkDatabaseClient.insertShortUrlItem(shortUrlItem);

      if (result == 1) {
        return true;
      }
      return false;
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
