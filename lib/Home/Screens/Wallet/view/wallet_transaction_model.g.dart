// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wallet_transaction_model.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
class $FloorAppDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder databaseBuilder(String name) =>
      _$AppDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$AppDatabaseBuilder(null);
}

class _$AppDatabaseBuilder {
  _$AppDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$AppDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$AppDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<AppDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$AppDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$AppDatabase extends AppDatabase {
  _$AppDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  WalletTransactionModelDao? _walletTransactionModelDaoInstance;

  Future<sqflite.Database> open(
    String path,
    List<Migration> migrations, [
    Callback? callback,
  ]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `WalletTransactionModel` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `title` TEXT NOT NULL, `subTitle` TEXT NOT NULL, `amount` REAL NOT NULL)');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  WalletTransactionModelDao get walletTransactionModelDao {
    return _walletTransactionModelDaoInstance ??=
        _$WalletTransactionModelDao(database, changeListener);
  }
}

class _$WalletTransactionModelDao extends WalletTransactionModelDao {
  _$WalletTransactionModelDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database, changeListener),
        _walletTransactionModelInsertionAdapter = InsertionAdapter(
            database,
            'WalletTransactionModel',
            (WalletTransactionModel item) => <String, Object?>{
                  'id': item.id,
                  'title': item.title,
                  'subTitle': item.subTitle,
                  'amount': item.amount
                },
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<WalletTransactionModel>
      _walletTransactionModelInsertionAdapter;

  @override
  Future<List<WalletTransactionModel>> findAllWalletTransactions() async {
    return _queryAdapter.queryList('SELECT * FROM WalletTransactionModel',
        mapper: (Map<String, Object?> row) => WalletTransactionModel(
            id: row['id'] as int?,
            title: row['title'] as String,
            subTitle: row['subTitle'] as String,
            amount: row['amount'] as double));
  }

  @override
  Stream<WalletTransactionModel?> findWalletTransactionById(int id) {
    return _queryAdapter.queryStream(
        'SELECT * FROM WalletTransactionModel WHERE id = ?1',
        mapper: (Map<String, Object?> row) => WalletTransactionModel(
            id: row['id'] as int?,
            title: row['title'] as String,
            subTitle: row['subTitle'] as String,
            amount: row['amount'] as double),
        arguments: [id],
        queryableName: 'WalletTransactionModel',
        isView: false);
  }

  @override
  Future<void> insertWalletTransaction(
      WalletTransactionModel walletTransaction) async {
    await _walletTransactionModelInsertionAdapter.insert(
        walletTransaction, OnConflictStrategy.abort);
  }

  @override
  Future<void> insertWalletTransactions(
      List<WalletTransactionModel> tasks) async {
    await _walletTransactionModelInsertionAdapter.insertList(
        tasks, OnConflictStrategy.abort);
  }
}
