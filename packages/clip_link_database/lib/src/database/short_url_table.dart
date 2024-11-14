import 'package:clip_link_database/clip_link_database.dart';
import 'package:drift/drift.dart';

@UseRowClass(ShortUrlModel)
class ShortUrlTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get shortCode => text()();
  TextColumn get originalUrl => text()();
  TextColumn get shortenedUrl => text()();
  BoolColumn get isHavePassword => boolean()();
  TextColumn get password => text().nullable()();
  BoolColumn get isFavorited => boolean().withDefault(const Constant(false))();
}
