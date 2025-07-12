import 'package:flutter/material.dart';
import 'package:streams_in_floor/presentation/screens/form.dart';
import 'package:streams_in_floor/presentation/widgets/teacher_widget.dart';

import '../../domain/entities/teacher.dart';

class TeacherListScreen extends StatelessWidget {

  final String titleScreen;
  final List<Teacher> teachers;

  const TeacherListScreen({
    super.key,
    required this.titleScreen,
    required this.teachers
  });

  Widget _buildList(List<Teacher> teachers) {
    return ListView.builder(
      itemCount: teachers.length,
      itemBuilder: (_, i) {
      final t = teachers[i];
      return TeacherWidget(teacher: t);
    },);
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text(titleScreen)),
      body: _buildList(teachers),
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
