import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:streams_in_floor/presentation/providers/teacher/teacher_async_notifier.dart';
import 'package:streams_in_floor/presentation/screens/form.dart';
import 'package:streams_in_floor/presentation/widgets/teacher_widget.dart';

import '../../../shared/utils/constants.dart';

class TeacherListScreen extends ConsumerWidget {
  const TeacherListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final teachersAsync = ref.watch(teacherNotifierProvider);

    return Scaffold(
      appBar: AppBar(title: const Text(asyncNotifierTitleScreen)),
      body: teachersAsync.when(
        data: (teachers) => ListView.builder(
          itemCount: teachers.length,
          itemBuilder: (_, i) {
            final t = teachers[i];
            return TeacherWidget(name: t.name, dni: t.dni);
          },
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Error: $e')),
      ),
      floatingActionButton: FloatingActionButton(
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
