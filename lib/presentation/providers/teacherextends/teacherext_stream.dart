
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:streams_in_floor/domain/entities/teacher_extends.dart';
import 'package:streams_in_floor/presentation/providers/teacherextends/teacherext_repository.dart';

final teacherExtendsStreamProvider = StreamProvider.autoDispose<List<TeacherExtends>>((ref){
  final repo = ref.watch(teacherExtRepositoryProvider);
  return repo.getAllStreamedTeacherExtends();
});

final teacherExtNameStreamProvider = StreamProvider.autoDispose.family<List<TeacherExtends>, String>((ref, name){
  final repo = ref.watch(teacherExtRepositoryProvider);
  return repo.getStreamedTeacherExtendsByName(name);
});