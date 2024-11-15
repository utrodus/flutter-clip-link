import 'package:clip_link_database/clip_link_database.dart';
import 'package:drift/drift.dart';

class ClipLinkDatabaseClient {
  final Database _database;
  ClipLinkDatabaseClient({Database? database})
      : _database = database ?? Database();

  Future<int> insertShortUrlItem(ShortUrlItemModel shortUrlItemModel) async =>
      await _database.managers.shortUrlTable.create(
        (item) => item(
          originalUrl: shortUrlItemModel.originalUrl,
          shortenedUrl: shortUrlItemModel.shortenedUrl,
          shortCode: shortUrlItemModel.shortCode,
          isHavePassword: shortUrlItemModel.isHavePassword,
          password: shortUrlItemModel.isHavePassword
              ? Value(shortUrlItemModel.password)
              : const Value.absent(),
          isFavorited: const Value(false),
        ),
      );

  Stream<List<ShortUrlItemModel>> getAllShortUrlItems() =>
      _database.managers.shortUrlTable.watch();

  Stream<List<ShortUrlItemModel>> getAllFavoritesShortUrlItems() =>
      _database.managers.shortUrlTable
          .filter((row) => row.isFavorited.isTrue())
          .watch();

  Future<int> addItemToFavorites({required int id}) async =>
      await _database.managers.shortUrlTable
          .filter(
            (row) => row.id(id),
          )
          .update(
            (item) => item(
              isFavorited: const Value(true),
            ),
          );

  Future<int> removeItemFromFavorites({required int id}) async =>
      await _database.managers.shortUrlTable.filter((row) => row.id(id)).update(
            (item) => item(
              isFavorited: const Value(false),
            ),
          );
}
