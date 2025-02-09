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

  Future<String?> generateShortUrl({
    required String url,
    String? alias,
    String? password,
  }) async {
    try {
      final response = await _spooMeApiClient.postShortenUrl(
          url: url, alias: alias, password: password);

      final shortUrlItem = ShortUrlItemModel(
        shortenedUrl: response.url,
        shortCode: getShortCode(shortenedUrl: response.url),
        isHavePassword: password != null,
        password: password,
        originalUrl: url,
        isFavorited: false,
      );

      await _clipLinkDatabaseClient.insertShortUrlItem(shortUrlItem);
      return response.url;
    } catch (e) {
      rethrow;
    }
  }

  String getShortCode({required String shortenedUrl}) =>
      shortenedUrl.split('/').last;

  Future addToFavorites({required int id}) async {
    try {
      return await _clipLinkDatabaseClient.addItemToFavorites(id: id);
    } catch (e) {
      throw ('Error adding item to favorites');
    }
  }

  Future removeFromFavorites({required int id}) async {
    try {
      return await _clipLinkDatabaseClient.removeItemFromFavorites(id: id);
    } catch (e) {
      throw ('Error removing item from favorites');
    }
  }

  Future removeShortenUrlItem({required String shortCode}) {
    try {
      return _clipLinkDatabaseClient.removeShortUrlItem(shortCode: shortCode);
    } catch (e) {
      throw ('Error removing item from database');
    }
  }

  Stream<List<ShortUrlItem>> getRecentsShortenedUrlItems() {
    return _clipLinkDatabaseClient.getAllShortUrlItems().map(
          (listOfShortUrlItem) => listOfShortUrlItem
              .map((item) => ShortUrlItem(
                  id: item.id,
                  shortCode: item.shortCode,
                  originalUrl: item.originalUrl,
                  shortenedUrl: item.shortenedUrl,
                  isHavePassword: item.isHavePassword,
                  isFavorited: item.isFavorited,
                  password: item.password))
              .toList(),
        );
  }

  Stream<List<ShortUrlItem>> getAllFavoritesShortUrlItems() {
    return _clipLinkDatabaseClient.getAllFavoritesShortUrlItems().map(
          (listOfShortUrlItem) => listOfShortUrlItem
              .map((item) => ShortUrlItem(
                  id: item.id,
                  shortCode: item.shortCode,
                  originalUrl: item.originalUrl,
                  shortenedUrl: item.shortenedUrl,
                  isHavePassword: item.isHavePassword,
                  isFavorited: item.isFavorited,
                  password: item.password))
              .toList(),
        );
  }

  Future<UrlStatistics> loadUrlStatistics({
    required String shortCode,
    String? password,
  }) async {
    try {
      final response = await _spooMeApiClient.getUrlStatistics(
          shortCode: shortCode, password: password);
      return UrlStatistics.toModel(response);
    } catch (e) {
      rethrow;
    }
  }
}
