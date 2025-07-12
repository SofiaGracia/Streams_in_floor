import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/entities/teacher.dart';
import '../providers/teacher/teacher_repository.dart';

class TeacherWidget extends ConsumerWidget {
  final Teacher teacher;

  const TeacherWidget({super.key, required this.teacher});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
        margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Expanded(
                  child: Column(
                children: [Text(teacher.name), Text(teacher.dni)],
              )),
              IconButton(
                  onPressed: () async {
                    final repo = ref.read(teacherRepositoryProvider);
                    await repo.deleteTeacher(teacher);
                  },
                  icon: Icon(Icons.delete))
            ],
          ),
        ));
  }
}
