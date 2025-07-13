import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:streams_in_floor/data/repository/teacherextends_db.dart';
import 'package:streams_in_floor/presentation/providers/database.dart';

final teacherExtRepositoryProvider = Provider<TeacherExtendsRepository>((ref) {
  final db = ref.watch(appDatabaseProvider);
  return TeacherExtendsRepository(db.teacherExtendsDao);
});