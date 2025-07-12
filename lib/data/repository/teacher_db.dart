import '../../domain/entities/teacher.dart';
import '../datasources/db/dao/teacher_dao.dart';

class TeacherRepository {
  final TeacherDao _dao;

  TeacherRepository(this._dao);

  Future<List<Teacher>> getAllTeachers() => _dao.findAllTeachers();

  Stream<List<Teacher>> getAllStreamedTeachers() => _dao.streamAllTeachers();

  Stream<List<Teacher>> getStreamedTeachersByName(String name) => _dao.findTeachersByName(name);

  Stream<List<String>> getDnisTeacher() => _dao.getDnisTeacher();

  Future<void> addTeacher(Teacher teacher) => _dao.insertTeacher(teacher);

  Future<int> deleteTeacher(Teacher teacher) => _dao.deleteTeacher(teacher);

}
