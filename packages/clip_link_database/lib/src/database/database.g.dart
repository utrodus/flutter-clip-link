// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $ShortUrlTableTable extends ShortUrlTable
    with TableInfo<$ShortUrlTableTable, ShortUrlItemModel> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ShortUrlTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _shortCodeMeta =
      const VerificationMeta('shortCode');
  @override
  late final GeneratedColumn<String> shortCode = GeneratedColumn<String>(
      'short_code', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _originalUrlMeta =
      const VerificationMeta('originalUrl');
  @override
  late final GeneratedColumn<String> originalUrl = GeneratedColumn<String>(
      'original_url', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _shortenedUrlMeta =
      const VerificationMeta('shortenedUrl');
  @override
  late final GeneratedColumn<String> shortenedUrl = GeneratedColumn<String>(
      'shortened_url', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _isHavePasswordMeta =
      const VerificationMeta('isHavePassword');
  @override
  late final GeneratedColumn<bool> isHavePassword = GeneratedColumn<bool>(
      'is_have_password', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("is_have_password" IN (0, 1))'));
  static const VerificationMeta _passwordMeta =
      const VerificationMeta('password');
  @override
  late final GeneratedColumn<String> password = GeneratedColumn<String>(
      'password', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _isFavoritedMeta =
      const VerificationMeta('isFavorited');
  @override
  late final GeneratedColumn<bool> isFavorited = GeneratedColumn<bool>(
      'is_favorited', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("is_favorited" IN (0, 1))'),
      defaultValue: const Constant(false));
  @override
  List<GeneratedColumn> get $columns => [
        id,
        shortCode,
        originalUrl,
        shortenedUrl,
        isHavePassword,
        password,
        isFavorited
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'short_url_table';
  @override
  VerificationContext validateIntegrity(Insertable<ShortUrlItemModel> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('short_code')) {
      context.handle(_shortCodeMeta,
          shortCode.isAcceptableOrUnknown(data['short_code']!, _shortCodeMeta));
    } else if (isInserting) {
      context.missing(_shortCodeMeta);
    }
    if (data.containsKey('original_url')) {
      context.handle(
          _originalUrlMeta,
          originalUrl.isAcceptableOrUnknown(
              data['original_url']!, _originalUrlMeta));
    } else if (isInserting) {
      context.missing(_originalUrlMeta);
    }
    if (data.containsKey('shortened_url')) {
      context.handle(
          _shortenedUrlMeta,
          shortenedUrl.isAcceptableOrUnknown(
              data['shortened_url']!, _shortenedUrlMeta));
    } else if (isInserting) {
      context.missing(_shortenedUrlMeta);
    }
    if (data.containsKey('is_have_password')) {
      context.handle(
          _isHavePasswordMeta,
          isHavePassword.isAcceptableOrUnknown(
              data['is_have_password']!, _isHavePasswordMeta));
    } else if (isInserting) {
      context.missing(_isHavePasswordMeta);
    }
    if (data.containsKey('password')) {
      context.handle(_passwordMeta,
          password.isAcceptableOrUnknown(data['password']!, _passwordMeta));
    }
    if (data.containsKey('is_favorited')) {
      context.handle(
          _isFavoritedMeta,
          isFavorited.isAcceptableOrUnknown(
              data['is_favorited']!, _isFavoritedMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ShortUrlItemModel map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ShortUrlItemModel(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      shortCode: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}short_code'])!,
      originalUrl: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}original_url'])!,
      shortenedUrl: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}shortened_url'])!,
      isHavePassword: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_have_password'])!,
      isFavorited: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_favorited'])!,
      password: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}password']),
    );
  }

  @override
  $ShortUrlTableTable createAlias(String alias) {
    return $ShortUrlTableTable(attachedDatabase, alias);
  }
}

class ShortUrlTableCompanion extends UpdateCompanion<ShortUrlItemModel> {
  final Value<int> id;
  final Value<String> shortCode;
  final Value<String> originalUrl;
  final Value<String> shortenedUrl;
  final Value<bool> isHavePassword;
  final Value<String?> password;
  final Value<bool> isFavorited;
  const ShortUrlTableCompanion({
    this.id = const Value.absent(),
    this.shortCode = const Value.absent(),
    this.originalUrl = const Value.absent(),
    this.shortenedUrl = const Value.absent(),
    this.isHavePassword = const Value.absent(),
    this.password = const Value.absent(),
    this.isFavorited = const Value.absent(),
  });
  ShortUrlTableCompanion.insert({
    this.id = const Value.absent(),
    required String shortCode,
    required String originalUrl,
    required String shortenedUrl,
    required bool isHavePassword,
    this.password = const Value.absent(),
    this.isFavorited = const Value.absent(),
  })  : shortCode = Value(shortCode),
        originalUrl = Value(originalUrl),
        shortenedUrl = Value(shortenedUrl),
        isHavePassword = Value(isHavePassword);
  static Insertable<ShortUrlItemModel> custom({
    Expression<int>? id,
    Expression<String>? shortCode,
    Expression<String>? originalUrl,
    Expression<String>? shortenedUrl,
    Expression<bool>? isHavePassword,
    Expression<String>? password,
    Expression<bool>? isFavorited,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (shortCode != null) 'short_code': shortCode,
      if (originalUrl != null) 'original_url': originalUrl,
      if (shortenedUrl != null) 'shortened_url': shortenedUrl,
      if (isHavePassword != null) 'is_have_password': isHavePassword,
      if (password != null) 'password': password,
      if (isFavorited != null) 'is_favorited': isFavorited,
    });
  }

  ShortUrlTableCompanion copyWith(
      {Value<int>? id,
      Value<String>? shortCode,
      Value<String>? originalUrl,
      Value<String>? shortenedUrl,
      Value<bool>? isHavePassword,
      Value<String?>? password,
      Value<bool>? isFavorited}) {
    return ShortUrlTableCompanion(
      id: id ?? this.id,
      shortCode: shortCode ?? this.shortCode,
      originalUrl: originalUrl ?? this.originalUrl,
      shortenedUrl: shortenedUrl ?? this.shortenedUrl,
      isHavePassword: isHavePassword ?? this.isHavePassword,
      password: password ?? this.password,
      isFavorited: isFavorited ?? this.isFavorited,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (shortCode.present) {
      map['short_code'] = Variable<String>(shortCode.value);
    }
    if (originalUrl.present) {
      map['original_url'] = Variable<String>(originalUrl.value);
    }
    if (shortenedUrl.present) {
      map['shortened_url'] = Variable<String>(shortenedUrl.value);
    }
    if (isHavePassword.present) {
      map['is_have_password'] = Variable<bool>(isHavePassword.value);
    }
    if (password.present) {
      map['password'] = Variable<String>(password.value);
    }
    if (isFavorited.present) {
      map['is_favorited'] = Variable<bool>(isFavorited.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ShortUrlTableCompanion(')
          ..write('id: $id, ')
          ..write('shortCode: $shortCode, ')
          ..write('originalUrl: $originalUrl, ')
          ..write('shortenedUrl: $shortenedUrl, ')
          ..write('isHavePassword: $isHavePassword, ')
          ..write('password: $password, ')
          ..write('isFavorited: $isFavorited')
          ..write(')'))
        .toString();
  }
}

abstract class _$Database extends GeneratedDatabase {
  _$Database(QueryExecutor e) : super(e);
  $DatabaseManager get managers => $DatabaseManager(this);
  late final $ShortUrlTableTable shortUrlTable = $ShortUrlTableTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [shortUrlTable];
}

typedef $$ShortUrlTableTableCreateCompanionBuilder = ShortUrlTableCompanion
    Function({
  Value<int> id,
  required String shortCode,
  required String originalUrl,
  required String shortenedUrl,
  required bool isHavePassword,
  Value<String?> password,
  Value<bool> isFavorited,
});
typedef $$ShortUrlTableTableUpdateCompanionBuilder = ShortUrlTableCompanion
    Function({
  Value<int> id,
  Value<String> shortCode,
  Value<String> originalUrl,
  Value<String> shortenedUrl,
  Value<bool> isHavePassword,
  Value<String?> password,
  Value<bool> isFavorited,
});

class $$ShortUrlTableTableFilterComposer
    extends Composer<_$Database, $ShortUrlTableTable> {
  $$ShortUrlTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get shortCode => $composableBuilder(
      column: $table.shortCode, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get originalUrl => $composableBuilder(
      column: $table.originalUrl, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get shortenedUrl => $composableBuilder(
      column: $table.shortenedUrl, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isHavePassword => $composableBuilder(
      column: $table.isHavePassword,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get password => $composableBuilder(
      column: $table.password, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isFavorited => $composableBuilder(
      column: $table.isFavorited, builder: (column) => ColumnFilters(column));
}

class $$ShortUrlTableTableOrderingComposer
    extends Composer<_$Database, $ShortUrlTableTable> {
  $$ShortUrlTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get shortCode => $composableBuilder(
      column: $table.shortCode, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get originalUrl => $composableBuilder(
      column: $table.originalUrl, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get shortenedUrl => $composableBuilder(
      column: $table.shortenedUrl,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isHavePassword => $composableBuilder(
      column: $table.isHavePassword,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get password => $composableBuilder(
      column: $table.password, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isFavorited => $composableBuilder(
      column: $table.isFavorited, builder: (column) => ColumnOrderings(column));
}

class $$ShortUrlTableTableAnnotationComposer
    extends Composer<_$Database, $ShortUrlTableTable> {
  $$ShortUrlTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get shortCode =>
      $composableBuilder(column: $table.shortCode, builder: (column) => column);

  GeneratedColumn<String> get originalUrl => $composableBuilder(
      column: $table.originalUrl, builder: (column) => column);

  GeneratedColumn<String> get shortenedUrl => $composableBuilder(
      column: $table.shortenedUrl, builder: (column) => column);

  GeneratedColumn<bool> get isHavePassword => $composableBuilder(
      column: $table.isHavePassword, builder: (column) => column);

  GeneratedColumn<String> get password =>
      $composableBuilder(column: $table.password, builder: (column) => column);

  GeneratedColumn<bool> get isFavorited => $composableBuilder(
      column: $table.isFavorited, builder: (column) => column);
}

class $$ShortUrlTableTableTableManager extends RootTableManager<
    _$Database,
    $ShortUrlTableTable,
    ShortUrlItemModel,
    $$ShortUrlTableTableFilterComposer,
    $$ShortUrlTableTableOrderingComposer,
    $$ShortUrlTableTableAnnotationComposer,
    $$ShortUrlTableTableCreateCompanionBuilder,
    $$ShortUrlTableTableUpdateCompanionBuilder,
    (
      ShortUrlItemModel,
      BaseReferences<_$Database, $ShortUrlTableTable, ShortUrlItemModel>
    ),
    ShortUrlItemModel,
    PrefetchHooks Function()> {
  $$ShortUrlTableTableTableManager(_$Database db, $ShortUrlTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ShortUrlTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ShortUrlTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ShortUrlTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> shortCode = const Value.absent(),
            Value<String> originalUrl = const Value.absent(),
            Value<String> shortenedUrl = const Value.absent(),
            Value<bool> isHavePassword = const Value.absent(),
            Value<String?> password = const Value.absent(),
            Value<bool> isFavorited = const Value.absent(),
          }) =>
              ShortUrlTableCompanion(
            id: id,
            shortCode: shortCode,
            originalUrl: originalUrl,
            shortenedUrl: shortenedUrl,
            isHavePassword: isHavePassword,
            password: password,
            isFavorited: isFavorited,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String shortCode,
            required String originalUrl,
            required String shortenedUrl,
            required bool isHavePassword,
            Value<String?> password = const Value.absent(),
            Value<bool> isFavorited = const Value.absent(),
          }) =>
              ShortUrlTableCompanion.insert(
            id: id,
            shortCode: shortCode,
            originalUrl: originalUrl,
            shortenedUrl: shortenedUrl,
            isHavePassword: isHavePassword,
            password: password,
            isFavorited: isFavorited,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$ShortUrlTableTableProcessedTableManager = ProcessedTableManager<
    _$Database,
    $ShortUrlTableTable,
    ShortUrlItemModel,
    $$ShortUrlTableTableFilterComposer,
    $$ShortUrlTableTableOrderingComposer,
    $$ShortUrlTableTableAnnotationComposer,
    $$ShortUrlTableTableCreateCompanionBuilder,
    $$ShortUrlTableTableUpdateCompanionBuilder,
    (
      ShortUrlItemModel,
      BaseReferences<_$Database, $ShortUrlTableTable, ShortUrlItemModel>
    ),
    ShortUrlItemModel,
    PrefetchHooks Function()>;

class $DatabaseManager {
  final _$Database _db;
  $DatabaseManager(this._db);
  $$ShortUrlTableTableTableManager get shortUrlTable =>
      $$ShortUrlTableTableTableManager(_db, _db.shortUrlTable);
}
