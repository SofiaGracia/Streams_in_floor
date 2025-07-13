import 'package:flutter/material.dart';
import 'package:streams_in_floor/presentation/screens/teacher/teacher_async.dart';
import 'package:streams_in_floor/presentation/screens/teacher/teacher_search.dart';
import 'package:streams_in_floor/presentation/screens/teacher/teacher_stream.dart';
import 'package:streams_in_floor/presentation/screens/teacherextends/teacherext_async.dart';
import 'package:streams_in_floor/presentation/screens/teacherextends/teacherext_search.dart';
import 'package:streams_in_floor/presentation/screens/teacherextends/teacherext_stream.dart';

import '../widgets/navigation_bar.dart';

class HomeWithDrawer extends StatefulWidget {
  const HomeWithDrawer({super.key});

  @override
  State<HomeWithDrawer> createState() => _HomeWithDrawerState();
}

class _HomeWithDrawerState extends State<HomeWithDrawer> {
  int selectedAppIndex = 0;

  final List<Widget> _apps = [
    const NavigationBarApp(
      searchScreen: SearchTeacher(),
      asyncScreen: AsyncTeacherListScreen(),
      streamScreen: StreamTeacherListScreen(),
    ),
    const NavigationBarApp(
      searchScreen: SearchTeacherExtends(),
      asyncScreen: AsyncTeacherExtListScreen(),
      streamScreen: StreamTeacherExtListScreen(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Drawer with NavigationBarApps'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Text('Choose App', style: TextStyle(color: Colors.white)),
            ),
            ListTile(
              leading: Icon(Icons.apps),
              title: const Text('Teacher without inheriting'),
              selected: selectedAppIndex == 0,
              onTap: () {
                setState(() {
                  selectedAppIndex = 0;
                });
                Navigator.pop(context); // Tanca el drawer
              },
            ),
            ListTile(
              leading: Icon(Icons.apps),
              title: const Text('Teacher inheriting from User'),
              selected: selectedAppIndex == 1,
              onTap: () {
                setState(() {
                  selectedAppIndex = 1;
                });
                Navigator.pop(context); // Tanca el drawer
              },
            ),
          ],
        ),
      ),
      body: _apps[selectedAppIndex],
    );
  }
}
