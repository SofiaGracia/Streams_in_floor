import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:streams_in_floor/presentation/providers/teacherextends/teacherext_repository.dart';
import 'package:streams_in_floor/presentation/providers/teacherextends/teacherext_stream.dart';
import 'package:streams_in_floor/presentation/widgets/teacher_widget.dart';

import '../../../shared/utils/constants.dart';
import '../../widgets/search_bar.dart';

class SearchTeacherExtends extends ConsumerStatefulWidget {
  const SearchTeacherExtends({super.key});

  @override
  SearchTeacherState createState() => SearchTeacherState();
}

class SearchTeacherState extends ConsumerState<SearchTeacherExtends> {
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
    final teachersAsync = ref.watch(teacherExtNameStreamProvider(valueSearched));

    return teachersAsync.when(data: (teachers) {
      return _buildScreen(ListView.builder(
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
      ));
    }, error: (e, stack) {
      return _buildScreen(Text('Error: $e'));
    }, loading: () {
      return _buildScreen(const CircularProgressIndicator());
    });
  }
}
