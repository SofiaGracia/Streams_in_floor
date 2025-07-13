// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

abstract class $AppDatabaseBuilderContract {
  /// Adds migrations to the builder.
  $AppDatabaseBuilderContract addMigrations(List<Migration> migrations);

  /// Adds a database [Callback] to the builder.
  $AppDatabaseBuilderContract addCallback(Callback callback);

  /// Creates the database and initializes it.
  Future<AppDatabase> build();
}

// ignore: avoid_classes_with_only_static_members
class $FloorAppDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static $AppDatabaseBuilderContract databaseBuilder(String name) =>
      _$AppDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static $AppDatabaseBuilderContract inMemoryDatabaseBuilder() =>
      _$AppDatabaseBuilder(null);
}

class _$AppDatabaseBuilder implements $AppDatabaseBuilderContract {
  _$AppDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  @override
  $AppDatabaseBuilderContract addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  @override
  $AppDatabaseBuilderContract addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  @override
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

  TeacherDao? _teacherDaoInstance;

  TeacherExtendsDao? _teacherExtendsDaoInstance;

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
            'CREATE TABLE IF NOT EXISTS `teacher` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `name` TEXT NOT NULL, `dni` TEXT NOT NULL)');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `teacherextends` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `dni` TEXT NOT NULL, `name` TEXT NOT NULL)');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  TeacherDao get teacherDao {
    return _teacherDaoInstance ??= _$TeacherDao(database, changeListener);
  }

  @override
  TeacherExtendsDao get teacherExtendsDao {
    return _teacherExtendsDaoInstance ??=
        _$TeacherExtendsDao(database, changeListener);
  }
}

class _$TeacherDao extends TeacherDao {
  _$TeacherDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database, changeListener),
        _teacherInsertionAdapter = InsertionAdapter(
            database,
            'teacher',
            (Teacher item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'dni': item.dni
                },
            changeListener),
        _teacherUpdateAdapter = UpdateAdapter(
            database,
            'teacher',
            ['id'],
            (Teacher item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'dni': item.dni
                },
            changeListener),
        _teacherDeletionAdapter = DeletionAdapter(
            database,
            'teacher',
            ['id'],
            (Teacher item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'dni': item.dni
                },
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Teacher> _teacherInsertionAdapter;

  final UpdateAdapter<Teacher> _teacherUpdateAdapter;

  final DeletionAdapter<Teacher> _teacherDeletionAdapter;

  @override
  Future<List<Teacher>> findAllTeachers() async {
    return _queryAdapter.queryList('SELECT * FROM teacher',
        mapper: (Map<String, Object?> row) => Teacher(
            id: row['id'] as int?,
            name: row['name'] as String,
            dni: row['dni'] as String));
  }

  @override
  Stream<Teacher?> findTeacherById(int id) {
    return _queryAdapter.queryStream('SELECT * FROM teacher WHERE id = ?1',
        mapper: (Map<String, Object?> row) => Teacher(
            id: row['id'] as int?,
            name: row['name'] as String,
            dni: row['dni'] as String),
        arguments: [id],
        queryableName: 'teacher',
        isView: false);
  }

  @override
  Stream<List<Teacher>> streamAllTeachers() {
    return _queryAdapter.queryListStream('SELECT * FROM teacher',
        mapper: (Map<String, Object?> row) => Teacher(
            id: row['id'] as int?,
            name: row['name'] as String,
            dni: row['dni'] as String),
        queryableName: 'teacher',
        isView: false);
  }

  @override
  Stream<List<Teacher>> findTeachersByName(String name) {
    return _queryAdapter.queryListStream(
        'SELECT * FROM teacher WHERE name LIKE ?1 || \"%\"',
        mapper: (Map<String, Object?> row) => Teacher(
            id: row['id'] as int?,
            name: row['name'] as String,
            dni: row['dni'] as String),
        arguments: [name],
        queryableName: 'teacher',
        isView: false);
  }

  @override
  Stream<List<String>> getDnisTeacher() {
    return _queryAdapter.queryListStream('SELECT dni FROM teacher',
        mapper: (Map<String, Object?> row) => row.values.first as String,
        queryableName: 'teacher',
        isView: false);
  }

  @override
  Future<int> insertTeacher(Teacher teacher) {
    return _teacherInsertionAdapter.insertAndReturnId(
        teacher, OnConflictStrategy.abort);
  }

  @override
  Future<int> updateTeacher(Teacher teacher) {
    return _teacherUpdateAdapter.updateAndReturnChangedRows(
        teacher, OnConflictStrategy.abort);
  }

  @override
  Future<int> deleteTeacher(Teacher teacher) {
    return _teacherDeletionAdapter.deleteAndReturnChangedRows(teacher);
  }
}

class _$TeacherExtendsDao extends TeacherExtendsDao {
  _$TeacherExtendsDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database, changeListener),
        _teacherExtendsInsertionAdapter = InsertionAdapter(
            database,
            'teacherextends',
            (TeacherExtends item) => <String, Object?>{
                  'id': item.id,
                  'dni': item.dni,
                  'name': item.name
                },
            changeListener),
        _teacherExtendsUpdateAdapter = UpdateAdapter(
            database,
            'teacherextends',
            ['id'],
            (TeacherExtends item) => <String, Object?>{
                  'id': item.id,
                  'dni': item.dni,
                  'name': item.name
                },
            changeListener),
        _teacherExtendsDeletionAdapter = DeletionAdapter(
            database,
            'teacherextends',
            ['id'],
            (TeacherExtends item) => <String, Object?>{
                  'id': item.id,
                  'dni': item.dni,
                  'name': item.name
                },
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<TeacherExtends> _teacherExtendsInsertionAdapter;

  final UpdateAdapter<TeacherExtends> _teacherExtendsUpdateAdapter;

  final DeletionAdapter<TeacherExtends> _teacherExtendsDeletionAdapter;

  @override
  Future<List<TeacherExtends>> findAllTeachersExtends() async {
    return _queryAdapter.queryList('SELECT * FROM teacherextends',
        mapper: (Map<String, Object?> row) => TeacherExtends(
            id: row['id'] as int?,
            name: row['name'] as String,
            dni: row['dni'] as String));
  }

  @override
  Stream<TeacherExtends?> findTeacherExtendsById(int id) {
    return _queryAdapter.queryStream(
        'SELECT * FROM teacherextends WHERE id = ?1',
        mapper: (Map<String, Object?> row) => TeacherExtends(
            id: row['id'] as int?,
            name: row['name'] as String,
            dni: row['dni'] as String),
        arguments: [id],
        queryableName: 'teacherextends',
        isView: false);
  }

  @override
  Stream<List<TeacherExtends>> streamAllTeacherExtends() {
    return _queryAdapter.queryListStream('SELECT * FROM teacherextends',
        mapper: (Map<String, Object?> row) => TeacherExtends(
            id: row['id'] as int?,
            name: row['name'] as String,
            dni: row['dni'] as String),
        queryableName: 'teacherextends',
        isView: false);
  }

  @override
  Stream<List<TeacherExtends>> findTeacherExtendsByName(String name) {
    return _queryAdapter.queryListStream(
        'SELECT * FROM teacherextends WHERE name LIKE ?1 || \"%\"',
        mapper: (Map<String, Object?> row) => TeacherExtends(
            id: row['id'] as int?,
            name: row['name'] as String,
            dni: row['dni'] as String),
        arguments: [name],
        queryableName: 'teacherextends',
        isView: false);
  }

  @override
  Stream<List<String>> getDnisTeacherExtends() {
    return _queryAdapter.queryListStream('SELECT dni FROM teacherextends',
        mapper: (Map<String, Object?> row) => row.values.first as String,
        queryableName: 'teacherextends',
        isView: false);
  }

  @override
  Future<int> insertTeacherExtends(TeacherExtends teacher) {
    return _teacherExtendsInsertionAdapter.insertAndReturnId(
        teacher, OnConflictStrategy.abort);
  }

  @override
  Future<int> updateTeacherExtends(TeacherExtends teacher) {
    return _teacherExtendsUpdateAdapter.updateAndReturnChangedRows(
        teacher, OnConflictStrategy.abort);
  }

  @override
  Future<int> deleteTeacherExtends(TeacherExtends teacher) {
    return _teacherExtendsDeletionAdapter.deleteAndReturnChangedRows(teacher);
  }
}
