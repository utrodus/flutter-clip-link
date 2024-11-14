import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:clip_link_database/clip_link_database.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late Database database;
  late ClipLinkDatabaseClient clipLinkDatabaseClient;

  setUp(() {
    final inMemory = DatabaseConnection(NativeDatabase.memory());
    database = Database.forTesting(inMemory);
    clipLinkDatabaseClient = ClipLinkDatabaseClient(
      database: database,
    );
  });

  tearDown(() {
    database.close();
  });

  group('ClipLinkDatabaseClient', () {
    group('insertShortUrlItem', () {
      test('should successfully insert short url item', () async {
        const shortUrlItemOne = ShortUrlModel(
          id: 1,
          shortCode: 'abc123',
          originalUrl: 'https://www.utrodus.com',
          shortenedUrl: 'https://www.spoo.me/abc123',
          isHavePassword: false,
          isFavorited: false,
          password: null,
        );
        const shortUrlItemTwo = ShortUrlModel(
          id: 2,
          shortCode: 'abc123',
          originalUrl: 'https://www.utrodus.com',
          shortenedUrl: 'https://www.spoo.me/abc123',
          isHavePassword: false,
          isFavorited: false,
          password: null,
        );

        await clipLinkDatabaseClient.insertShortUrlItem(shortUrlItemOne);
        await clipLinkDatabaseClient.insertShortUrlItem(shortUrlItemTwo);
        expectLater(database.managers.shortUrlTable.count(), completion(2));
      });
    });

    group('addItemToFavorites', () {
      test('should successfully add item to favorites', () async {
        const shortUrlItemOne = ShortUrlModel(
          id: 1,
          shortCode: 'abc123',
          originalUrl: 'https://www.utrodus.com',
          shortenedUrl: 'https://www.spoo.me/abc123',
          isHavePassword: false,
          isFavorited: false,
          password: null,
        );
        await clipLinkDatabaseClient.insertShortUrlItem(shortUrlItemOne);
        await clipLinkDatabaseClient.addItemToFavorites(id: 1);
        final result = await database.managers.shortUrlTable
            .filter((row) => row.id.equals(1))
            .get();
        expect(
          result,
          isA<List<ShortUrlModel>>()
              .having((value) => value.length, 'length', 1)
              .having((value) => value.first.isFavorited, 'isFavorited', true),
        );
      });
    });

    group('getAllShortUrlItems', () {
      const shortUrlItemOne = ShortUrlModel(
        id: 1,
        shortCode: 'abc123',
        originalUrl: 'https://example.com',
        shortenedUrl: 'https://short.ly/abc123',
        isHavePassword: false,
        isFavorited: false,
      );
      const shortUrlItemTwo = ShortUrlModel(
        id: 2,
        shortCode: 'abc123',
        originalUrl: 'https://example.com',
        shortenedUrl: 'https://short.ly/abc123',
        isHavePassword: false,
        isFavorited: false,
      );

      test('should return list of short url items', () async {
        await clipLinkDatabaseClient.insertShortUrlItem(shortUrlItemOne);
        await clipLinkDatabaseClient.insertShortUrlItem(shortUrlItemTwo);
        expect(
            clipLinkDatabaseClient.getAllShortUrlItems(),
            emitsInOrder([
              isA<List<ShortUrlModel>>()
                  .having((value) => value.length, 'length', 2)
            ]));
      });
    });

    group('getAllFavoritesShortUrlItems', () {
      const shortUrlItemOne = ShortUrlModel(
        id: 1,
        shortCode: 'abc123',
        originalUrl: 'https://example.com',
        shortenedUrl: 'https://short.ly/abc123',
        isHavePassword: false,
        isFavorited: true,
      );
      const shortUrlItemTwo = ShortUrlModel(
        id: 2,
        shortCode: 'abc123',
        originalUrl: 'https://example.com',
        shortenedUrl: 'https://short.ly/abc123',
        isHavePassword: false,
        isFavorited: false,
      );

      test('should return list of favorites short url items', () async {
        await clipLinkDatabaseClient.insertShortUrlItem(shortUrlItemOne);
        await clipLinkDatabaseClient.insertShortUrlItem(shortUrlItemTwo);
        await clipLinkDatabaseClient.addItemToFavorites(id: 1);
        await clipLinkDatabaseClient.addItemToFavorites(id: 2);
        expect(
            clipLinkDatabaseClient.getAllFavoritesShortUrlItems(),
            emitsInOrder([
              isA<List<ShortUrlModel>>()
                  .having((value) => value.length, 'length', 2)
                  .having(
                      (value) => value.first.isFavorited, 'isFavorited', true)
                  .having(
                      (value) => value.last.isFavorited, 'isFavorited', true),
            ]));
      });
    });

    group('removeItemFromFavorites', () {
      const shortUrlItemOne = ShortUrlModel(
        id: 1,
        shortCode: 'abc123',
        originalUrl: 'https://example.com',
        shortenedUrl: 'https://short.ly/abc123',
        isHavePassword: false,
        isFavorited: true,
      );
      const shortUrlItemTwo = ShortUrlModel(
        id: 2,
        shortCode: 'abc123',
        originalUrl: 'https://example.com',
        shortenedUrl: 'https://short.ly/abc123',
        isHavePassword: false,
        isFavorited: false,
      );

      test('should remove item from favorites', () async {
        await clipLinkDatabaseClient.insertShortUrlItem(shortUrlItemOne);
        await clipLinkDatabaseClient.insertShortUrlItem(shortUrlItemTwo);
        await clipLinkDatabaseClient.addItemToFavorites(id: 1);
        await clipLinkDatabaseClient.addItemToFavorites(id: 2);
        await clipLinkDatabaseClient.removeItemFromFavorites(id: 1);

        expect(
            clipLinkDatabaseClient.getAllFavoritesShortUrlItems(),
            emitsInOrder([
              isA<List<ShortUrlModel>>()
                  .having((value) => value.length, 'length', 1)
            ]));
      });
    });
  });
}
