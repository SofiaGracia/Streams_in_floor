import 'package:floor/floor.dart';

import '../../../../domain/entities/teacher_extends.dart';

@dao
abstract class TeacherExtendsDao {
  @Query('SELECT * FROM teacherextends')
  Future<List<TeacherExtends>> findAllTeachersExtends();

  @Query('SELECT * FROM teacherextends WHERE id = :id')
  Stream<TeacherExtends?> findTeacherExtendsById(int id);

  @Query('SELECT * FROM teacherextends')
  Stream<List<TeacherExtends>> streamAllTeacherExtends();

  @Query('SELECT dni FROM teacherextends')
  Stream<List<String>> getDnisTeacherExtends();

  @insert
  Future<int> insertTeacherExtends(TeacherExtends teacher);

  @update
  Future<int> updateTeacherExtends(TeacherExtends teacher);

  @delete
  Future<int> deleteTeacherExtends(TeacherExtends teacher);
}
