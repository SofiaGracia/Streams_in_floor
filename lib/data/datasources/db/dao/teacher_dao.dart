import 'package:floor/floor.dart';
import '../../../../domain/entities/teacher.dart';

@dao
abstract class TeacherDao {
  @Query('SELECT * FROM teacher')
  Future<List<Teacher>> findAllTeachers();

  @Query('SELECT * FROM teacher WHERE id = :id')
  Stream<Teacher?> findTeacherById(int id);

  @Query('SELECT * FROM teacher')
  Stream<List<Teacher>> streamAllTeachers();
  
  @Query('SELECT dni FROM teacher')
  Stream<List<String>> getDnisTeacher();

  @insert
  Future<int> insertTeacher(Teacher teacher);

  @update
  Future<int> updateTeacher(Teacher teacher);

  @delete
  Future<int> deleteTeacher(Teacher teacher);
}
