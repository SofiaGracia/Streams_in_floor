
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:streams_in_floor/presentation/screens/teacherextends/teacher_list.dart';

import '../../../shared/utils/constants.dart';
import '../../providers/teacherextends/teacherext_async_notifier.dart';

class AsyncTeacherExtListScreen extends ConsumerWidget {
  const AsyncTeacherExtListScreen({super.key});

  Widget _buildScreen(Widget passedChild){
    return Scaffold(
      body: Center(
        child: passedChild,
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final teachersExtAsync = ref.watch(teacherExtNotifierProvider);

    return teachersExtAsync.when(
        data: (teachers) {
          return TeacherExtListScreen(teachers: teachers, titleScreen: asyncNotifierTitleScreen);
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