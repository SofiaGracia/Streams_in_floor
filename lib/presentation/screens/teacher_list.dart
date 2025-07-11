import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:streams_in_floor/presentation/screens/form.dart';

import '../providers/teacher_repository.dart';

class TeacherListScreen extends ConsumerWidget {
  const TeacherListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final teachersAsync = ref.watch(teacherListDnisProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Teachers Dnis')),
      body: teachersAsync.when(
        data: (teachersDnis) => ListView.builder(
          itemCount: teachersDnis.length,
          itemBuilder: (_, i) {
            final t = teachersDnis[i];
            return ListTile(
              title: Text(t),
              subtitle: Text('DNI: ${t}'),
            );
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
