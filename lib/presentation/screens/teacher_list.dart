import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:streams_in_floor/presentation/screens/form.dart';
import 'package:streams_in_floor/presentation/widgets/teacher_widget.dart';

import '../../domain/entities/teacher.dart';
import '../providers/teacher/teacher_repository.dart';

class TeacherListScreen extends ConsumerWidget {
  final String titleScreen;
  final List<Teacher> teachers;

  const TeacherListScreen(
      {super.key, required this.titleScreen, required this.teachers});

  Widget _buildList(List<Teacher> teachers, WidgetRef ref) {
    return ListView.builder(
      itemCount: teachers.length,
      itemBuilder: (_, i) {
        final t = teachers[i];
        return TeacherWidget(
          name: t.name,
          dni: t.dni,
          onDelete: () async {
            final repo = ref.read(teacherRepositoryProvider);
            await repo.deleteTeacher(t);
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: Text(titleScreen)),
      body: _buildList(teachers, ref),
      floatingActionButton: FloatingActionButton(
          heroTag: null,
          child: const Icon(Icons.add),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => FormScreen(),
              ),
            );
          }),
    );
  }
}
