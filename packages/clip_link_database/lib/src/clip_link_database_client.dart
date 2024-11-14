import 'package:clip_link_database/clip_link_database.dart';
import 'package:drift/drift.dart';

class ClipLinkDatabaseClient {
  final Database _database;
  ClipLinkDatabaseClient({Database? database})
      : _database = database ?? Database();

  Future<int> insertShortUrlItem(ShortUrlModel shortUrlModel) async =>
      await _database.managers.shortUrlTable.create(
        (item) => item(
          originalUrl: shortUrlModel.originalUrl,
          shortenedUrl: shortUrlModel.shortenedUrl,
          shortCode: shortUrlModel.shortCode,
          isHavePassword: shortUrlModel.isHavePassword,
          password: shortUrlModel.isHavePassword
              ? Value(shortUrlModel.password)
              : const Value.absent(),
          isFavorited: const Value(false),
        ),
      );

  Stream<List<ShortUrlModel>> getAllShortUrlItems() =>
      _database.managers.shortUrlTable.watch();

  Stream<List<ShortUrlModel>> getAllFavoritesShortUrlItems() =>
      _database.managers.shortUrlTable
          .filter((row) => row.isFavorited.isTrue())
          .watch();

  Future addItemToFavorites({required int id}) async =>
      await _database.managers.shortUrlTable
          .filter(
            (row) => row.id(id),
          )
          .update(
            (item) => item(
              isFavorited: const Value(true),
            ),
          );

  Future removeItemFromFavorites({required int id}) async =>
      await _database.managers.shortUrlTable.filter((row) => row.id(id)).update(
            (item) => item(
              isFavorited: const Value(false),
            ),
          );
}
