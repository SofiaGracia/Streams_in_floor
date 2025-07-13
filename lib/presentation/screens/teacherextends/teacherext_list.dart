
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:streams_in_floor/domain/entities/teacher_extends.dart';
import 'package:streams_in_floor/presentation/providers/teacherextends/teacherext_repository.dart';

import '../../widgets/teacher_widget.dart';
import '../form.dart';

class TeacherExtListScreen extends ConsumerWidget {
  final String titleScreen;
  final List<TeacherExtends> teachers;

  const TeacherExtListScreen(
      {super.key, required this.titleScreen, required this.teachers});

  Widget _buildList(List<TeacherExtends> teachers, WidgetRef ref) {
    return ListView.builder(
      itemCount: teachers.length,
      itemBuilder: (_, i) {
        final t = teachers[i];
        return TeacherWidget(
          name: t.name,
          dni: t.dni,
          onDelete: () async {
            final repo = ref.read(teacherExtRepositoryProvider);
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
                builder: (context) => FormScreen(isExtendedClass: true,),
              ),
            );
          }),
    );
  }
}
