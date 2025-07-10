import 'package:streams_in_floor/data/datasources/db/dao/teacherextends_dao.dart';

import 'dao/teacher_dao.dart';
import 'database.dart';

class DatabaseService {
  static AppDatabase? _db;

  late TeacherDao _teacherDao;
  late TeacherExtendsDao _teacherExtendsDao;

  static final DatabaseService _instance = DatabaseService._internal();

  DatabaseService._internal();

  factory DatabaseService() {
    return _instance;
  }

  TeacherDao get teacherDao => _teacherDao;
  TeacherExtendsDao get teacherExtendsDao => _teacherExtendsDao;
  AppDatabase? get db => _db;

  Future<AppDatabase> connectDB() async {
    try {
      if (_db != null) return _db!;
      _db = await $FloorAppDatabase
          .databaseBuilder('database.db')
          .build();
      _teacherDao = _db!.teacherDao;
      _teacherExtendsDao = _db!.teacherExtendsDao;
      return _db!;
    } catch (e) {
      throw Exception("Error connecting database: $e");
    }
  }

  Future<void> diconnectDB() async {

    try{
      if (_db != null) {
        await _db!.close();
        _db = null;
      }
    }catch (e) {
      throw Exception("Error disconnecting database: $e");
    }
  }
}

