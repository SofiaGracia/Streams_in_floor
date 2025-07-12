import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:streams_in_floor/presentation/providers/teacher/teacher_stream.dart';

import '../../../shared/utils/constants.dart';
import '../teacher_list.dart';

class StreamTeacherListScreen extends ConsumerWidget {
  const StreamTeacherListScreen({super.key});

  Widget _buildScreen(Widget passedChild){
    return Scaffold(
      body: Center(
        child: passedChild,
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final teachersAsync = ref.watch(teacherStreamProvider);

    return teachersAsync.when(
        data: (teachers) {
          return TeacherListScreen(teachers: teachers, titleScreen: streamNotifierTitleScreen);
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
