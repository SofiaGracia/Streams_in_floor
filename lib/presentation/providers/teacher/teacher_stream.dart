import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:streams_in_floor/presentation/providers/teacher/teacher_repository.dart';

final teacherDnisStreamProvider = StreamProvider.autoDispose<List<String>>((ref) {
  final repo = ref.watch(teacherRepositoryProvider);
  return repo.getDnisTeacher();
});