
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:streams_in_floor/data/repository/teacher_db.dart';
import 'package:streams_in_floor/presentation/providers/teacher/teacher_repository.dart';

import '../../../domain/entities/teacher.dart';

class TeacherNotifier extends AsyncNotifier<List<Teacher>> {

  //Getter
  TeacherRepository get _repo => ref.watch(teacherRepositoryProvider);

  @override
  Future<List<Teacher>> build() async {

    final repo = _repo;
    List<Teacher> teachers = await repo.getAllTeachers();
    return teachers;
  }

  // Let's allow removing teachers
  Future<void> removeTeacher(Teacher teacher) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final repo = _repo;
      await repo.deleteTeacher(teacher);
      final current = state.requireValue;
      return current.where((t) => t != teacher).toList();
    });
  }
}

final teacherNotifierProvider =
AsyncNotifierProvider<TeacherNotifier, List<Teacher>>(TeacherNotifier.new);