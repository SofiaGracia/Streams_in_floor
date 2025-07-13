import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:streams_in_floor/data/repository/teacherextends_db.dart';
import 'package:streams_in_floor/domain/entities/teacher_extends.dart';
import 'package:streams_in_floor/presentation/providers/teacherextends/teacherext_repository.dart';

class TeacherExtNotifier extends AsyncNotifier<List<TeacherExtends>> {

  TeacherExtendsRepository get _repo => ref.watch(teacherExtRepositoryProvider);

  @override
  Future<List<TeacherExtends>> build() async {
    final repo = _repo;
    List<TeacherExtends> teachers = await repo.getAllTeachers();
    return teachers;
  }

  // Let's allow removing teachers
  Future<void> removeTeacher(TeacherExtends teacher) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final repo = _repo;
      await repo.deleteTeacher(teacher);
      final current = state.requireValue;
      return current.where((t) => t != teacher).toList();
    });
  }
}

final teacherExtNotifierProvider =
AsyncNotifierProvider<TeacherExtNotifier, List<TeacherExtends>>(TeacherExtNotifier.new);