import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:streams_in_floor/presentation/providers/teacher/teacher_repository.dart';

import '../../../domain/entities/teacher.dart';


final teacherStreamProvider = StreamProvider.autoDispose<List<Teacher>>((ref) {
  final repo = ref.watch(teacherRepositoryProvider);
  return repo.getAllStreamedTeachers();
});

final teacherDnisStreamProvider = StreamProvider.autoDispose<List<String>>((ref) {
  final repo = ref.watch(teacherRepositoryProvider);
  return repo.getDnisTeacher();
});

final teacherNameStreamProvider = StreamProvider.autoDispose.family<List<Teacher>, String>((ref, name){
  final repo = ref.watch(teacherRepositoryProvider);
  return repo.getStreamedTeachersByName(name);
});