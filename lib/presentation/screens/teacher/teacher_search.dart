import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:streams_in_floor/presentation/widgets/teacher_widget.dart';

import '../../../domain/entities/teacher.dart';
import '../../../shared/utils/constants.dart';
import '../../widgets/search_bar.dart';

class SearchTeacher extends ConsumerStatefulWidget {
  const SearchTeacher({super.key});

  @override
  SearchTeacherState createState() => SearchTeacherState();
}
class SearchTeacherState extends ConsumerState<SearchTeacher> {

  List<Teacher> teachersToShow = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(title: Text(searchTitleScreen)),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 10),
          Expanded(
            flex: 0,
            child: SearchWidget(onSearchaListChanged: (listValue) {
              setState(() {
                teachersToShow = listValue;
              });
            }),
          ),
          SizedBox(height: 10),
          ListView.builder(
            itemCount: teachersToShow.length,
            itemBuilder: (_, i) {
              final t = teachersToShow[i];
              return TeacherWidget(teacher: t);
            },
          )
        ],
      ),
    );
  }
}