import '../../domain/entities/teacher.dart';
import '../datasources/db/dao/teacher_dao.dart';

class TeacherRepository {
  final TeacherDao _dao;

  TeacherRepository(this._dao);

  Future<List<Teacher>> getAllTeachers() => _dao.findAllTeachers();

  Stream<List<String>> getDnisTeacher() => _dao.getDnisTeacher();

  Future<void> addTeacher(Teacher teacher) => _dao.insertTeacher(teacher);

// etc.
}
