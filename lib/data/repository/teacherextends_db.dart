import '../../domain/entities/teacher_extends.dart';
import '../datasources/db/dao/teacherextends_dao.dart';

class TeacherExtendsRepository {
  final TeacherExtendsDao _dao;

  TeacherExtendsRepository(this._dao);

  Future<List<TeacherExtends>> getAllTeachers() => _dao.findAllTeachersExtends();

  Stream<List<String>> getDnisTeacher() => _dao.getDnisTeacherExtends();

  Future<void> addTeacher(TeacherExtends teacher) => _dao.insertTeacherExtends(teacher);

  Future<int> deleteTeacher(TeacherExtends teacher) => _dao.deleteTeacherExtends(teacher);
}
