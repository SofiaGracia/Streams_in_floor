import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:streams_in_floor/presentation/providers/teacher/teacher_async_notifier.dart';
import 'package:streams_in_floor/presentation/screens/form.dart';
import 'package:streams_in_floor/presentation/widgets/teacher_widget.dart';

import '../../../shared/utils/constants.dart';
import '../teacher_list.dart';

class AsyncTeacherListScreen extends ConsumerWidget {
  const AsyncTeacherListScreen({super.key});
  
  Widget _buildScreen(Widget passedChild){
    return Scaffold(
      body: Center(
        child: passedChild,
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final teachersAsync = ref.watch(teacherNotifierProvider);

    return teachersAsync.when(
        data: (teachers) {
          return TeacherListScreen(teachers: teachers, titleScreen: asyncNotifierTitleScreen);
        },
        error: (e, stack) {
          return _buildScreen(Text('Error: $e'));
        },
        loading: () {
          return _buildScreen(const CircularProgressIndicator());
        }
    );
  }
}
