
import 'dart:async';

import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
import 'package:streams_in_floor/data/datasources/db/dao/teacherextends_dao.dart';

import '../../../domain/entities/teacher.dart';
import '../../../domain/entities/teacher_extends.dart';
import 'dao/teacher_dao.dart';

part 'database.g.dart';

@Database(version: 1, entities: [Teacher, TeacherExtends])
abstract class AppDatabase extends FloorDatabase {
  TeacherDao get teacherDao;
  TeacherExtendsDao get teacherExtendsDao;
}