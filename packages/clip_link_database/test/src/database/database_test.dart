import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:test/test.dart';
import 'package:clip_link_database/clip_link_database.dart';

void main() {
  late Database database;

  setUp(() {
    final inMemory = DatabaseConnection(NativeDatabase.memory());
    database = Database.forTesting(inMemory);
  });

  tearDown(() => database.close());

  group(
    'Database',
    () {
      test('should insert and retrieve data from ShortUrlTable', () async {
        final shortUrlEntry = ShortUrlTableCompanion.insert(
          id: const Value(1),
          shortCode: 'abc123',
          originalUrl: 'https://www.utrodus.com',
          shortenedUrl: 'https://www.spoo.me/abc123',
          isHavePassword: false,
          isFavorited: const Value(false),
          password: const Value.absent(),
        );
        await database.into(database.shortUrlTable).insert(shortUrlEntry);

        final result = await database.select(database.shortUrlTable).get();
        final firstRowData = result.first;
        expect(result.length, 1);
        expect(firstRowData.id, 1);
        expect(firstRowData.shortCode, 'abc123');
        expect(firstRowData.originalUrl, 'https://www.utrodus.com');
        expect(firstRowData.shortenedUrl, 'https://www.spoo.me/abc123');
        expect(firstRowData.isHavePassword, false);
        expect(firstRowData.isFavorited, false);
        expect(firstRowData.password, null);
      });

      test('should update and retrieve data from ShortUrlTable', () async {
        final shortUrlEntry = ShortUrlTableCompanion.insert(
          id: const Value(1),
          shortCode: 'abc123',
          originalUrl: 'https://www.utrodus.com',
          shortenedUrl: 'https://www.spoo.me/abc123',
          isHavePassword: false,
          isFavorited: const Value(false),
          password: const Value.absent(),
        );
        await database.into(database.shortUrlTable).insert(shortUrlEntry);

        // Update data
        const update = ShortUrlTableCompanion(isFavorited: Value(true));

        await (database.update(database.shortUrlTable)
              ..where((tbl) => tbl.id.equals(1)))
            .write(update);

        final result = await database.select(database.shortUrlTable).get();
        expect(result.first.isFavorited, true);
      });

      test('should delete data from ShortUrlTable', () async {
        // Insert data
        final shortUrlEntry = ShortUrlTableCompanion.insert(
          id: const Value(1),
          shortCode: 'abc123',
          originalUrl: 'https://www.utrodus.com',
          shortenedUrl: 'https://www.spoo.me/abc123',
          isHavePassword: false,
          isFavorited: const Value(false),
          password: const Value.absent(),
        );
        await database.into(database.shortUrlTable).insert(shortUrlEntry);

        // Delete data
        await (database.delete(database.shortUrlTable)
              ..where((tbl) => tbl.id.equals(1)))
            .go();

        // Verify data is deleted
        final result = await database.select(database.shortUrlTable).get();
        expect(result, isEmpty);
      });
    },
  );
}
