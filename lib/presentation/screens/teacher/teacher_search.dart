import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:streams_in_floor/presentation/widgets/teacher_widget.dart';

import '../../../shared/utils/constants.dart';
import '../../providers/teacher/teacher_stream.dart';
import '../../widgets/search_bar.dart';

class SearchTeacher extends ConsumerStatefulWidget {
  const SearchTeacher({super.key});

  @override
  SearchTeacherState createState() => SearchTeacherState();
}

class SearchTeacherState extends ConsumerState<SearchTeacher> {
  String valueSearched = '';

  Widget _buildScreen(Widget child) {
    return Scaffold(
      appBar: AppBar(title: Text(searchTitleScreen)),
      body: Column(
        //crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 10),
          Expanded(
            child: SearchWidget(onValueSearched: (value) {
              setState(() {
                valueSearched = value;
              });
            }),
          ),
          SizedBox(height: 10),
          Expanded(child: child),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final teachersAsync = ref.watch(teacherNameStreamProvider(valueSearched));

    return teachersAsync.when(data: (teachers) {
      return _buildScreen(ListView.builder(
        itemCount: teachers.length,
        itemBuilder: (_, i) {
          final t = teachers[i];
          return TeacherWidget(teacher: t);
        },
      ));
    }, error: (e, stack) {
      return _buildScreen(Text('Error: $e'));
    }, loading: () {
      return _buildScreen(const CircularProgressIndicator());
    });
  }
}
