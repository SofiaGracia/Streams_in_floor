import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:streams_in_floor/presentation/providers/teacher/teacher_stream.dart';
import 'package:streams_in_floor/presentation/providers/teacherextends/teacherext_stream.dart';
import 'package:streams_in_floor/presentation/screens/teacherextends/teacherext_list.dart';

import '../../../shared/utils/constants.dart';

class StreamTeacherExtListScreen extends ConsumerWidget {
  const StreamTeacherExtListScreen({super.key});

  Widget _buildScreen(Widget passedChild){
    return Scaffold(
      body: Center(
        child: passedChild,
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final teacherExtendsAsync = ref.watch(teacherExtendsStreamProvider);

    return teacherExtendsAsync.when(
        data: (teachers) {
          return TeacherExtListScreen(teachers: teachers, titleScreen: streamNotifierTitleScreen);
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
