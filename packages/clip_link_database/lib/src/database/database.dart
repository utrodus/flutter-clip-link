import 'package:clip_link_database/clip_link_database.dart';
import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:flutter/foundation.dart';

part 'database.g.dart';

@DriftDatabase(tables: [ShortUrlTable])
class Database extends _$Database {
  Database() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  static QueryExecutor _openConnection() {
    return driftDatabase(
      name: 'clip_link_database',
      web: DriftWebOptions(
        sqlite3Wasm: Uri.parse('sqlite3.wasm'),
        driftWorker: Uri.parse('drift_worker.js'),
        onResult: (result) {
          if (result.missingFeatures.isNotEmpty) {
            debugPrint(
                'Using ${result.chosenImplementation} due to unsupported '
                'browser features: ${result.missingFeatures}');
          }
        },
      ),
    );
  }

  Database.forTesting(DatabaseConnection super.connection);
}
