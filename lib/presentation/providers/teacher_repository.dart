import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/repository/teacher_db.dart';
import 'database.dart';

final teacherRepositoryProvider = Provider<TeacherRepository>((ref) {
  final db = ref.watch(appDatabaseProvider);
  return TeacherRepository(db.teacherDao);
});

final teacherListDnisProvider = StreamProvider.autoDispose<List<String>>((ref) {
  final repo = ref.watch(teacherRepositoryProvider);
  return repo.getDnisTeacher();
});
